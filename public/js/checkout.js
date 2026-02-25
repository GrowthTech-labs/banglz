/**
 * Complete Checkout Functionality - FIXED VERSION
 */


// Stripe Elements
let stripe, cardNumberElement, cardExpiryElement, cardCvcElement;
let selectedSavedCard = null;
let autocomplete;

// Initialize Stripe
function initializeStripe() {
    if (typeof Stripe === 'undefined') {
        return;
    }
    
    const stripeKey = window.STRIPE_KEY || 'pk_test_51T4OKLHg7qai9F3IZUrfwvzKR13g6laQUJecJ4P9bv1nSp2wbqLilQojV9CIqSAmJfBnyASjrEqdHMA4i3m1HgGF00T2qiFECn';
    
    stripe = Stripe(stripeKey);
    
    const elements = stripe.elements();
    const style = {
        base: {
            fontSize: '16px',
            color: '#32325d',
            '::placeholder': { color: '#aab7c4' }
        },
        invalid: {
            color: '#fa755a',
            iconColor: '#fa755a'
        }
    };
    
    cardNumberElement = elements.create('cardNumber', { style });
    cardExpiryElement = elements.create('cardExpiry', { style });
    cardCvcElement = elements.create('cardCvc', { style });
    
    cardNumberElement.mount('#card-number-element');
    cardExpiryElement.mount('#card-expiry-element');
    cardCvcElement.mount('#card-cvc-element');
    
    // Add event listeners for errors
    cardNumberElement.on('change', function(event) {
        if (event.error) {
            $('#card-errors').text(event.error.message);
        } else {
            $('#card-errors').text('');
        }
    });
    
    cardExpiryElement.on('change', function(event) {
        if (event.error) {
            $('#card-errors').text(event.error.message);
        } else {
            $('#card-errors').text('');
        }
    });
    
    cardCvcElement.on('change', function(event) {
        if (event.error) {
            $('#card-errors').text(event.error.message);
        } else {
            $('#card-errors').text('');
        }
    });
    
}

// Initialize Google Maps Autocomplete
function initializeGoogleMaps() {
    
    // ALWAYS make address fields editable for manual entry
    $('#country, #city, #state, #postcode, #street').prop('readonly', false);
    
    if (typeof google === 'undefined' || !google.maps || !google.maps.places) {
        $('#autocomplete').attr('placeholder', 'Enter your address manually in fields below');
        return;
    }
    
    const input = document.getElementById('autocomplete');
    if (!input) {
        return;
    }
    
    try {
        autocomplete = new google.maps.places.Autocomplete(input, {
            types: ['address']
        });
    } catch (error) {
        $('#autocomplete').attr('placeholder', 'Enter your address manually in fields below');
        return;
    }
    
    autocomplete.addListener('place_changed', function() {
        const place = autocomplete.getPlace();
        
        if (!place.geometry) {
            $('#error-autocomplete').text('Please select a valid address from the dropdown');
            return;
        }
        
        $('#error-autocomplete').text('');
        
        // Parse address components
        let street_number = '';
        let route = '';
        let city = '';
        let state = '';
        let country = '';
        let postcode = '';
        let country_short = '';
        let state_short = '';
        
        place.address_components.forEach(function(component) {
            const types = component.types;
            
            if (types.includes('street_number')) {
                street_number = component.long_name;
            }
            if (types.includes('route')) {
                route = component.long_name;
            }
            if (types.includes('locality')) {
                city = component.long_name;
            }
            if (types.includes('administrative_area_level_1')) {
                state = component.long_name;
                state_short = component.short_name;
            }
            if (types.includes('country')) {
                country = component.long_name;
                country_short = component.short_name;
            }
            if (types.includes('postal_code')) {
                postcode = component.long_name;
            }
            if (types.includes('sublocality_level_1') && !city) {
                city = component.long_name;
            }
        });
        
        const street = (street_number + ' ' + route).trim();
        
        
        // Fill form fields
        $('#street').val(street);
        $('#city').val(city);
        $('#state').val(state);
        $('#country').val(country);
        $('#postcode').val(postcode);
        $('#latitude').val(place.geometry.location.lat());
        $('#longitude').val(place.geometry.location.lng());
        $('#formatted_address').val(place.formatted_address);
        $('#country_iso').val(country_short);
        $('#province_code').val(state_short);
        $('#place_id').val(place.place_id);
        
        // Clear any existing errors
        $('#error-street, #error-city, #error-state, #error-country, #error-postcode').text('');
        
    });
    
}

// Document ready
$(document).ready(function() {
    
    // Initialize Toast if not already initialized
    if (typeof window.Toast === 'undefined') {
        window.Toast = Swal.mixin({
            toast: true,
            position: 'top-end',
            showConfirmButton: false,
            timer: 3000,
            timerProgressBar: true
        });
    }
    
    initializeStripe();
    initializeGoogleMaps();
    initializeEventHandlers();
    loadSavedCards();
});

// Initialize all event handlers
function initializeEventHandlers() {
    // Card toggle buttons
    $('.add-card-btn').on('click', function() {
        $(this).addClass('active');
        $('.save-card-btn').removeClass('active');
        $('#new-card-section').addClass('active').show();
        $('#saved-card-section').removeClass('active').hide();
    });
    
    $('.save-card-btn').on('click', function() {
        $(this).addClass('active');
        $('.add-card-btn').removeClass('active');
        $('#saved-card-section').addClass('active').show();
        $('#new-card-section').removeClass('active').hide();
    });
    
    // Default: show add card
    $('.add-card-btn').trigger('click');
    
    // Payment method change
    $('input[name="payment_method"]').on('change', function() {
        const method = $(this).val();
        
        if (method === 'paypal') {
            $('.card-button').hide();
            $('.card-info-fields').hide();
        } else {
            $('.card-button').show();
            if ($('.add-card-btn').hasClass('active')) {
                $('#new-card-section').show();
            } else {
                $('#saved-card-section').show();
            }
        }
    });
    
    // Place order button
    $('#placeOrderBtn').on('click', function(e) {
        e.preventDefault();
        handlePlaceOrder();
    });
    
    // Cancel button
    $('#cancelBtn').on('click', function(e) {
        e.preventDefault();
        window.location.href = '/cart';
    });
    
    // Apply gift card
    $('.apply-btn').on('click', function(e) {
        e.preventDefault();
        applyGiftCard();
    });
    
    // Remove gift card
    $('#remove-gift-card').on('click', function(e) {
        e.preventDefault();
        removeGiftCard();
    });
    
    // Reward boxes
    $('.reward-box').on('click', function() {
        const $this = $(this);
        const type = $this.data('type');
        
        if ($this.hasClass('active-reward')) {
            $this.removeClass('active-reward');
            removeReward();
        } else {
            $('.reward-box').removeClass('active-reward');
            $this.addClass('active-reward');
            applyReward(type, $this.data('value'));
        }
    });
    
    // Saved card selection
    $('#saved-cards').on('change', function() {
        selectedSavedCard = $(this).val();
        if (selectedSavedCard) {
            const option = $(this).find('option:selected');
            const last4 = option.data('last4');
            const exp = option.data('exp');
            $('#card-details').html(`Card: **** **** **** ${last4}<br>Exp: ${exp}`);
        }
    });
    
}

// Handle place order
function handlePlaceOrder() {
    
    // Validate terms
    if (!$('#terms_agreement').is(':checked')) {
        window.Toast.fire({
            icon: 'warning',
            title: 'Please accept the terms and conditions'
        });
        $('#terms-error').show();
        return;
    }
    $('#terms-error').hide();
    
    // Validate form
    if (!validateForm()) {
        window.Toast.fire({
            icon: 'warning',
            title: 'Please fill in all required fields'
        });
        return;
    }
    
    // Disable button
    $('#placeOrderBtn').prop('disabled', true).text('Processing...');
    
    const paymentMethod = $('input[name="payment_method"]:checked').val();
    
    if (paymentMethod === 'paypal') {
        processPayPalPayment();
    } else {
        processStripePayment();
    }
}

// Validate form
function validateForm() {
    let isValid = true;
    $('.field-error').text('');
    
    const type = window.TYPE || '';
    
    if (type !== 'gift_card') {
        // Validate personal info
        const name = $('input[name="name"]').val();
        const lastName = $('input[name="last_name"]').val();
        const phone = $('input[name="phone"]').val();
        const email = $('input[name="user_email"]').val();
        
        
        if (!name || !name.trim()) {
            $('#error-name').text('First name is required');
            isValid = false;
        }
        if (!lastName || !lastName.trim()) {
            $('#error-last_name').text('Last name is required');
            isValid = false;
        }
        if (!phone || !phone.trim()) {
            $('#error-phone').text('Phone is required');
            isValid = false;
        }
        if (!email || !email.trim()) {
            $('#error-email').text('Email is required');
            isValid = false;
        }
        
        // Validate address
        const country = $('#country').val();
        const city = $('#city').val();
        const state = $('#state').val();
        const postcode = $('#postcode').val();
        const street = $('#street').val();
        
        
        if (!country || !country.trim()) {
            $('#error-country').text('Country is required');
            isValid = false;
        }
        if (!city || !city.trim()) {
            $('#error-city').text('City is required');
            isValid = false;
        }
        if (!state || !state.trim()) {
            $('#error-state').text('State is required');
            isValid = false;
        }
        if (!postcode || !postcode.trim()) {
            $('#error-postcode').text('Postcode is required');
            isValid = false;
        }
        if (!street || !street.trim()) {
            $('#error-street').text('Street is required');
            isValid = false;
        }
    }
    
    return isValid;
}

// Process Stripe payment
async function processStripePayment() {

    try {
        const useNewCard = $('#new-card-section').hasClass('active');
        let paymentMethodId;

        if (useNewCard) {

            // Build billing address - only include country if we have a valid ISO code
            const countryIso = $('#country_iso').val();
            const billingAddress = {
                line1: $('#street').val(),
                city: $('#city').val(),
                state: $('#state').val(),
                postal_code: $('#postcode').val()
            };

            // Only add country if we have a valid 2-letter ISO code
            if (countryIso && countryIso.length === 2) {
                billingAddress.country = countryIso;
            }

            // Create payment method from card elements
            const { paymentMethod, error } = await stripe.createPaymentMethod({
                type: 'card',
                card: cardNumberElement,
                billing_details: {
                    name: $('input[name="name"]').val() + ' ' + $('input[name="last_name"]').val(),
                    email: $('input[name="user_email"]').val(),
                    phone: $('input[name="phone"]').val(),
                    address: billingAddress
                }
            });

            if (error) {
                throw new Error(error.message);
            }

            paymentMethodId = paymentMethod.id;
        } else {

            // Use saved card
            if (!selectedSavedCard) {
                throw new Error('Please select a saved card');
            }
            paymentMethodId = selectedSavedCard;
        }

        // Submit order
        await submitOrder(paymentMethodId, 'stripe');

    } catch (error) {
        window.Toast.fire({
            icon: 'error',
            title: error.message || 'Payment failed'
        });
        $('#placeOrderBtn').prop('disabled', false).text('Place order');
    }
}

// Process PayPal payment
function processPayPalPayment() {
    
    $('#paypal-processing').show();
    
    submitOrder(null, 'paypal')
        .then(response => {
            if (response.status === 'redirect' && response.approval_url) {
                // Redirect to PayPal for payment
                window.location.href = response.approval_url;
            } else if (response.status === 'ok' || response.status === 'success') {
                // Payment completed without redirect (shouldn't happen with PayPal)
                window.Toast.fire({
                    icon: 'success',
                    title: response.message || 'Order placed successfully!'
                });
                
                let redirectUrl = '/';
                if (response.order_id && response.date) {
                    redirectUrl = `/confirmation/${response.order_id}/${response.date}`;
                }
                
                setTimeout(() => {
                    window.location.href = redirectUrl;
                }, 1500);
            } else {
                throw new Error(response.message || 'PayPal payment failed');
            }
        })
        .catch(error => {
            $('#paypal-processing').hide();
            window.Toast.fire({
                icon: 'error',
                title: error.message || 'PayPal payment failed'
            });
            $('#placeOrderBtn').prop('disabled', false).text('Place order');
        });
}

// Submit order to backend
async function submitOrder(paymentMethodId, paymentType) {

    // Get active reward
    const activeReward = $('.reward-box.active-reward');
    let rewardType = '';
    let rewardValue = 0;
    let appliedPoints = 0;
    let appliedShipping = false;
    let rewardsDiscount = 0;

    if (activeReward.length) {
        rewardType = activeReward.data('type') || '';
        rewardValue = activeReward.data('value') || 0;

        if (rewardType === 'points') {
            appliedPoints = rewardValue;
            rewardsDiscount = rewardValue * 0.01; // Assuming 1 point = $0.01
        } else if (rewardType === 'shipping') {
            appliedShipping = true;
        }
    }

    // Get country ISO - if empty, try to derive from country name
    let countryIso = $('#country_iso').val() || '';
    const country = $('#country').val() || '';

    // If no ISO code but we have a country name, use a default or the country name
    if (!countryIso && country) {
        // For Pakistan specifically (common case)
        if (country.toLowerCase().includes('pakistan')) {
            countryIso = 'PK';
        } else {
            // Use first 2 letters as fallback
            countryIso = country.substring(0, 2).toUpperCase();
        }
    }

    // Parse latitude and longitude as numbers
    const latitude = parseFloat($('#latitude').val()) || 0;
    const longitude = parseFloat($('#longitude').val()) || 0;

    // Build the data in the format the backend expects
    const formData = {
        // Payment info
        payment_method_id: paymentMethodId,
        payment_type: paymentType, // Add payment type (stripe or paypal)
        save_card: $('#save_card').is(':checked') ? 1 : 0,

        // Amount info
        amount: window.AMOUNT || 0,
        currency: window.CURRENCY || 'usd',
        tax: window.TAX || 0,
        shipping_fee: window.SHIPPING_FEE || 0,
        subtotal: window.SUBTOTAL || 0,
        us_import_duties: 0,

        // User info
        email: $('input[name="user_email"]').val(),
        users_meta_data: {
            name: $('input[name="name"]').val(),
            last_name: $('input[name="last_name"]').val(),
            phone: $('input[name="phone"]').val()
        },

        // Delivery info
        delivery_meta_data: {
            address: $('#formatted_address').val() || $('#street').val(),
            country: country,
            country_iso: countryIso,
            state_province: $('#state').val(),
            city: $('#city').val(),
            street: $('#street').val(),
            postcode: $('#postcode').val() || '',
            latitude: latitude,
            longitude: longitude,
            province_code: $('#province_code').val() || '',
            place_id: $('#place_id').val() || '',
            area: $('#area').val() || '',
            sub_area: $('#sub_area').val() || ''
        },

        // Product data - backend expects this exact structure
        products_meta_data: window.PRODUCT_META_DATA || {},
        gift_card_meta_data: window.GIFT_CARD_META_DATA || [],
        bangle_box_meta_data: window.BANGLE_BOX_META_DATA || [],

        // Gift card
        applied_gift_card_meta_data: window.APPLIED_GIFT_CARD_META || [],
        appliedGiftCardCode: window.appliedGiftCardCode || '',
        appliedGiftCardAmount: window.appliedGiftCardAmount || 0,

        // Rewards
        applied_points: appliedPoints,
        applied_shipping: appliedShipping,
        rewards_discount: rewardsDiscount,

        // Order type
        type: window.TYPE || 'product',
        giftCardsTotal: window.GIFT_CARDS_TOTAL || 0
    };


    try {
        const response = await fetch('/checkout/create-payment-intent', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content'),
                'Accept': 'application/json'
            },
            body: JSON.stringify(formData)
        });

        const data = await response.json();

        // Log validation errors if present
        if (data.errors) {
        }

        if (!response.ok || data.status === 'error' || data.status === false) {
            throw new Error(data.message || 'Order failed');
        }

        // If payment requires confirmation (new card)
        if (data.client_secret) {
            const { error: confirmError } = await stripe.confirmCardPayment(data.client_secret, {
                payment_method: paymentMethodId
            });

            if (confirmError) {
                throw new Error(confirmError.message);
            }

        }

        // Success
        
        // Save card if user checked the box and is logged in
        const shouldSaveCard = $('#save_card').is(':checked');
        console.log('💳 Should save card?', shouldSaveCard, 'Payment Method ID:', paymentMethodId);
        
        if (shouldSaveCard && paymentMethodId) {
            try {
                console.log('💳 Attempting to save card...');
                await saveCard(paymentMethodId, formData.delivery_meta_data);
                console.log('✅ Card save completed');
            } catch (saveError) {
                console.error('❌ Card save failed:', saveError);
                // Don't fail the order if card save fails
            }
        } else {
            console.log('ℹ️ Skipping card save - checkbox not checked or no payment method');
        }
        
        window.Toast.fire({
            icon: 'success',
            title: data.message || 'Order placed successfully!'
        });

        // Build proper confirmation URL
        let redirectUrl = '/';
        if (data.order_id && data.date) {
            redirectUrl = `/confirmation/${data.order_id}/${data.date}`;
        } else if (data.redirect) {
            redirectUrl = data.redirect;
        }

        setTimeout(() => {
            window.location.href = redirectUrl;
        }, 1500);

        return data;
    } catch (error) {
        throw error;
    }
}

// Save card for future use
async function saveCard(paymentMethodId, deliveryData) {
    console.log('💳 Saving card...', {
        paymentMethodId: paymentMethodId,
        deliveryData: deliveryData
    });
    
    const cardData = {
        payment_method_id: paymentMethodId,
        save_card: 1,
        full_name: $('input[name="name"]').val() + ' ' + $('input[name="last_name"]').val(),
        street: deliveryData.street || '',
        city: deliveryData.city || '',
        state: deliveryData.state_province || '',
        zip: deliveryData.postcode || '',
        phone: $('input[name="phone"]').val() || ''
    };
    
    console.log('💳 Card data to save:', cardData);
    
    try {
        const response = await fetch('/cards/store', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content'),
                'Accept': 'application/json'
            },
            body: JSON.stringify(cardData)
        });
        
        const data = await response.json();
        console.log('💳 Save card response:', data);
        
        if (!response.ok || data.status !== 'ok') {
            throw new Error(data.message || 'Failed to save card');
        }
        
        console.log('✅ Card saved successfully');
        return data;
    } catch (error) {
        console.error('❌ Save card error:', error);
        throw error;
    }
}

// Apply gift card
function applyGiftCard() {
    const code = $('input[name="gift_card_code"]').val().trim();
    
    if (!code) {
        window.Toast.fire({ icon: 'warning', title: 'Please enter a gift card code' });
        return;
    }
    
    
    $.ajax({
        url: '/gift-card/validate',
        method: 'POST',
        data: { code: code },
        headers: { 
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content'),
            'Accept': 'application/json'
        },
        success: function(response) {
            
            if (response.success) {
                window.appliedGiftCardCode = code;
                window.appliedGiftCardAmount = parseFloat(response.amount) || 0;
                window.appliedGiftCardMax = parseFloat(response.max_amount) || 0;
                
                updateTotals();
                
                $('#applied-gift-card-row').removeClass('d-none');
                $('#applied-gift-card-amount').text(`-$${window.appliedGiftCardAmount.toFixed(2)}`);
                
                $('input[name="gift_card_code"]').prop('disabled', true);
                $('.apply-btn').prop('disabled', true);
                
                window.Toast.fire({ icon: 'success', title: 'Gift card applied!' });
            } else {
                window.Toast.fire({ icon: 'error', title: response.message || 'Invalid gift card' });
            }
        },
        error: function(xhr) {
            const errorMsg = xhr.responseJSON?.message || 'Failed to validate gift card';
            window.Toast.fire({ icon: 'error', title: errorMsg });
        }
    });
}

// Remove gift card
function removeGiftCard() {
    
    window.appliedGiftCardCode = '';
    window.appliedGiftCardAmount = 0;
    window.appliedGiftCardMax = 0;
    
    $('#applied-gift-card-row').addClass('d-none');
    $('input[name="gift_card_code"]').val('').prop('disabled', false);
    $('.apply-btn').prop('disabled', false);
    
    updateTotals();
    window.Toast.fire({ icon: 'info', title: 'Gift card removed' });
}

// Apply reward
function applyReward(type, value) {
    updateTotals();
}

// Remove reward
function removeReward() {
    updateTotals();
}

// Update totals
function updateTotals() {
    
    const type = window.TYPE || 'product';
    
    if (type === 'gift_card') {
        // For gift cards, just show the total
        const giftCardTotal = window.GIFT_CARDS_TOTAL || 0;
        $('#grand-total').text(`$${giftCardTotal.toFixed(2)}`);
        return;
    }
    
    // Calculate for products
    let subtotal = (window.AMOUNT || 0) - (window.TAX || 0) - (window.BASE_SHIPPING_FEE || 0);
    let tax = window.TAX || 0;
    let shipping = window.BASE_SHIPPING_FEE || 0;
    let discount = 0;
    
    // Apply reward discount
    const activeReward = $('.reward-box.active-reward');
    if (activeReward.length) {
        const rewardType = activeReward.data('type');
        const rewardValue = parseFloat(activeReward.data('value')) || 0;
        
        if (rewardType === 'points') {
            // Convert points to dollars (assuming 1 point = $0.01 or customize as needed)
            discount = rewardValue; // If points are already in dollar value
        } else if (rewardType === 'shipping') {
            shipping = 0;
        }
    }
    
    // Apply gift card discount
    const giftCardDiscount = window.appliedGiftCardAmount || 0;
    
    // Calculate total
    let total = subtotal + tax + shipping - discount - giftCardDiscount;
    total = Math.max(0, total);
    
    
    // Update UI
    $('#subtotal-amount').text(`$${subtotal.toFixed(2)}`);
    $('#tax-amount').text(`$${tax.toFixed(2)}`);
    $('#delivery-amount').text(`$${shipping.toFixed(2)}`);
    $('#grand-total').text(`$${total.toFixed(2)}`);
    
    if (discount > 0) {
        $('#discount-row').removeClass('d-none');
        $('#discount-amount').text(`-$${discount.toFixed(2)}`);
    } else {
        $('#discount-row').addClass('d-none');
    }
    
}

// Load saved cards
function loadSavedCards() {
    
    $.ajax({
        url: '/api/user/saved-cards',
        method: 'GET',
        headers: {
            'Accept': 'application/json',
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        success: function(response) {
            
            if (response.success && response.cards && response.cards.length > 0) {
                const $select = $('#saved-cards');
                $select.empty().append('<option value="">Select a card</option>');
                
                response.cards.forEach(card => {
                    const option = $(`<option value="${card.payment_method_id || card.id}" 
                        data-last4="${card.last4}" 
                        data-exp="${card.exp_month}/${card.exp_year}">
                        **** **** **** ${card.last4} (${card.brand || 'Card'})
                    </option>`);
                    $select.append(option);
                });
                
            } else {
                $('#saved-cards').html('<option value="">No saved cards</option>');
            }
        },
        error: function(xhr) {
            $('#saved-cards').html('<option value="">No saved cards available</option>');
        }
    });
}

