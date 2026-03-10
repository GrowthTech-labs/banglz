<x-layouts.user-default>
    <x-slot name="insertstyle">
        <link rel="stylesheet" href="{{ asset('assets/css/extra.css') }}">

        <style>
            #applied-gift-card-row {
                margin: 0;
            }
            #applied-gift-card-amount {
                font-weight: bold;
            }
            #remove-gift-card {
                text-decoration: none;
                font-size: 14px;
                cursor: pointer;
            }

            .d-none {
                display: none !important;
            }

            .active-reward {
                border: 2px solid #4caf50;
                background: #f0fff4;
                border-radius: 8px;
                transition: 0.2s ease-in-out;
            }

            .reward-container {
                display: flex;
                justify-content: center;
                gap: 40px;
                flex-wrap: nowrap;
            }

            .reward-box {
                margin-top: 20px;
                display: flex;
                flex-direction: column;
                align-items: center;
                cursor: pointer;
                padding: 10px;
                border: 2px solid transparent;
                border-radius: 10px;
                transition: 0.2s;
                width: 240px;
                text-align: center;
            }

            .reward-box img {
                max-width: 90px;
                margin-bottom: 8px;
            }

            .reward-box:hover {
                border-color: #ccc;
            }

            .reward-box.selected {
                border-color: #28a745;
                background: #f6fff6;
            }

            .blog-detail-hearo {
                margin-bottom: 0px
            }

            .card-info-fields {
                display: none;
            }

            .card-info-fields.active {
                display: flex;
            }

            .place-order {
                background-color: #8d5943;
            }

            .btn.active {
                background: #5f3a2a;
                color: white;
            }

            .saved-details {
                padding: 8px;
                border: 1px solid #ddd;
                border-radius: 6px;
                background: #f9f9f9;
            }

            .save-card {
                align-items: center;
            }

            .save-card label {
                font-weight: 600;
            }

            .save-card select {
                width: 250px;
                border: 1px solid #ddd;
                border-radius: 6px;
            }

            .stripe-mount {
                padding: .375rem .75rem;
                min-height: 38px;
                line-height: 1.5;
                border: 0;
                border-bottom: 1px solid #e9e9e9;
                border-radius: 0;
                background: transparent;
                box-shadow: none;
                font-size: 16px;
                height: 90%;
                padding: 15px;
            }

            .field-error {
                color: #d9534f;
                font-size: .9rem;
                margin-top: 6px;
                display: block;
            }

            .card-errors {
                color: #d9534f;
                margin-top: 6px;
            }
            .paypal-icon img{
                height: 40px !important;
                width: 100px !important;
            }
            .link-term{
                color: black !important;
                font-weight: 600 !important;
            }
            .terms-checkbox {
                margin: 15px 0;
                text-align: center;
            }
            .terms-checkbox label {
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 8px;
                cursor: pointer;
                font-size: 14px;
            }
            .terms-checkbox input[type="checkbox"] {
                width: 16px;
                height: 16px;
            }
            .terms-error {
                color: #d9534f;
                font-size: 14px;
                margin-top: 5px;
                text-align: center;
                display: none;
            }
            [type="checkbox"]:checked,
            [type="checkbox"]:not(:checked) {
                position: unset;
            }

            /* ========== MOBILE RESPONSIVE STYLES ========== */
            @media (max-width: 768px) {
                .product-detail-main-wrapper {
                    padding: 0 !important;
                    margin: 0 !important;
                }

                .checkout-main-section {
                    padding: 0 !important;
                    margin: 0 !important;
                }

                .check-out-wraper {
                    padding: 0 !important;
                    margin: 0 !important;
                }

                .top-header {
                    padding: 10px 15px !important;
                    margin: 0 !important;
                }

                .checkout-section-body {
                    flex-direction: column !important;
                    gap: 0 !important;
                    padding: 0 !important;
                    margin: 0 !important;
                }

                .left-checkout-form-wrapper {
                    width: 100% !important;
                    padding: 15px !important;
                    margin: 0 !important;
                }

                .right-cart-items-detail {
                    width: 100% !important;
                    padding: 15px !important;
                    margin: 0 !important;
                    border-top: 1px solid #eee;
                }

                .name-fields {
                    flex-direction: column !important;
                    gap: 8px !important;
                }

                .name-fields .input-field {
                    width: 100% !important;
                    margin-bottom: 0 !important;
                }

                .input-field {
                    margin-bottom: 8px !important;
                }

                .input-field input,
                .input-field select {
                    width: 100% !important;
                    font-size: 16px !important;
                    box-sizing: border-box !important;
                }

                .payment-types {
                    flex-direction: column !important;
                    gap: 8px !important;
                }

                .payment-type-row {
                    padding: 10px !important;
                    flex-direction: row !important;
                    justify-content: space-between !important;
                    margin-bottom: 0 !important;
                }

                .card-button {
                    flex-direction: column !important;
                    gap: 8px !important;
                    margin-bottom: 0 !important;
                }

                .card-button .btn {
                    width: 100% !important;
                    padding: 10px !important;
                    margin: 0 !important;
                }

                .card-info-fields {
                    flex-direction: column !important;
                    gap: 8px !important;
                }

                .card-info-fields .input-field {
                    width: 100% !important;
                    margin-bottom: 0 !important;
                }

                .promo-section {
                    padding: 10px !important;
                    margin: 8px 0 !important;
                }

                .promo-field {
                    flex-direction: column !important;
                    gap: 8px !important;
                }

                .promo-field .form-group {
                    width: 100% !important;
                    margin: 0 !important;
                }

                .promo-field .form-group input {
                    width: 100% !important;
                    box-sizing: border-box !important;
                }

                .promo-field .btn {
                    width: 100% !important;
                    margin: 0 !important;
                }

                .reward-container {
                    flex-direction: column !important;
                    gap: 10px !important;
                    align-items: stretch !important;
                }

                .reward-box {
                    width: 100% !important;
                    padding: 12px !important;
                    margin: 0 !important;
                }

                .cart-items-total {
                    padding: 10px 0 !important;
                    margin: 0 !important;
                }

                .cart-items-total p {
                    font-size: 13px !important;
                    padding: 5px 0 !important;
                    margin: 0 !important;
                }

                .cart-total-payment {
                    padding: 10px 0 !important;
                    margin: 10px 0 0 0 !important;
                }

                .cart-total-payment h1 {
                    font-size: 18px !important;
                    margin: 0 0 10px 0 !important;
                }

                .cart-footer-buttons {
                    flex-direction: column !important;
                    gap: 8px !important;
                    margin: 0 !important;
                }

                .cart-footer-buttons .btn {
                    width: 100% !important;
                    padding: 10px !important;
                    font-size: 14px !important;
                    margin: 0 !important;
                }

                .common-button-light,
                .common-button {
                    width: 100% !important;
                    margin: 0 !important;
                }

                .terms-checkbox {
                    padding: 10px 0 !important;
                    margin: 8px 0 !important;
                }

                .terms-checkbox label {
                    font-size: 11px !important;
                    flex-direction: row !important;
                    align-items: flex-start !important;
                    gap: 6px !important;
                }

                .terms-checkbox input[type="checkbox"] {
                    margin-top: 2px !important;
                    flex-shrink: 0;
                }

                .top-header h1 {
                    font-size: 22px !important;
                    margin: 0 !important;
                }

                .save-card select {
                    width: 100% !important;
                    box-sizing: border-box !important;
                }

                .saved-details {
                    padding: 8px !important;
                    font-size: 12px !important;
                    margin: 8px 0 !important;
                }

                .paypal-icon img {
                    height: 28px !important;
                    width: 75px !important;
                }

                .right-icon img {
                    max-width: 75px !important;
                    height: auto !important;
                }

                h1 {
                    font-size: 16px !important;
                    margin: 12px 0 8px 0 !important;
                }
            }

            /* Extra small devices */
            @media (max-width: 480px) {
                .product-detail-main-wrapper {
                    padding: 0 !important;
                    margin: 0 !important;
                }

                .checkout-main-section {
                    padding: 0 !important;
                    margin: 0 !important;
                }

                .check-out-wraper {
                    padding: 0 !important;
                    margin: 0 !important;
                }

                .top-header {
                    padding: 8px 12px !important;
                    margin: 0 !important;
                }

                .checkout-section-body {
                    padding: 0 !important;
                    margin: 0 !important;
                }

                .left-checkout-form-wrapper {
                    padding: 12px !important;
                    margin: 0 !important;
                }

                .right-cart-items-detail {
                    padding: 12px !important;
                    margin: 0 !important;
                }

                .top-header h1 {
                    font-size: 18px !important;
                    margin: 0 !important;
                }

                .top-header h1 span {
                    font-size: 18px !important;
                }

                .name-fields {
                    gap: 6px !important;
                }

                .input-field input,
                .input-field select {
                    font-size: 14px !important;
                    padding: 8px !important;
                    box-sizing: border-box !important;
                }

                .payment-type-row {
                    padding: 8px !important;
                }

                .card-button .btn {
                    font-size: 13px !important;
                    padding: 8px !important;
                }

                .promo-section {
                    padding: 8px !important;
                    margin: 6px 0 !important;
                }

                .promo-section h1 {
                    font-size: 14px !important;
                    margin: 0 0 6px 0 !important;
                }

                .reward-box {
                    padding: 10px !important;
                    width: 100% !important;
                    margin: 0 !important;
                }

                .reward-box img {
                    max-width: 60px !important;
                    margin-bottom: 5px !important;
                }

                .reward-box h3 {
                    font-size: 13px !important;
                    margin: 0 !important;
                }

                .reward-box p {
                    font-size: 11px !important;
                    margin: 3px 0 0 0 !important;
                }

                .cart-items-total p {
                    font-size: 12px !important;
                    padding: 4px 0 !important;
                    margin: 0 !important;
                }

                .cart-total-payment h1 {
                    font-size: 16px !important;
                    margin: 0 0 8px 0 !important;
                }

                .cart-footer-buttons .btn {
                    font-size: 13px !important;
                    padding: 8px !important;
                }

                .terms-checkbox label {
                    font-size: 10px !important;
                }

                .alert {
                    font-size: 12px !important;
                    padding: 8px !important;
                    margin: 0 !important;
                }

                .stripe-mount {
                    font-size: 13px !important;
                    padding: 10px !important;
                }

                .field-error {
                    font-size: 11px !important;
                }

                h1 {
                    font-size: 14px !important;
                    margin: 10px 0 6px 0 !important;
                }
            }
        </style>
    </x-slot>

    <x-slot name="content">
        <div class="product-detail-main-wrapper">
            <div class="checkout-main-section check-out-wraper">
                <div class="top-header">
                    <h1><span>Checkout</span></h1>
                </div>
                
                {{-- Display error message if payment was cancelled or failed --}}
                @if(session('error'))
                <div class="alert alert-danger" style="margin: 20px 0; padding: 15px; background: #f8d7da; border: 1px solid #f5c6cb; border-radius: 5px; color: #721c24;">
                    <strong>Error:</strong> {{ session('error') }}
                </div>
                @endif
                
                @if(session('success'))
                <div class="alert alert-success" style="margin: 20px 0; padding: 15px; background: #d4edda; border: 1px solid #c3e6cb; border-radius: 5px; color: #155724;">
                    <strong>Success:</strong> {{ session('success') }}
                </div>
                @endif
                
                <div class="checkout-section-body">
                    <div class="left-checkout-form-wrapper">
                        <form id="checkoutForm" onsubmit="return false;">
                           <h1 style="{{ $type === 'gift_card' ? 'display:none;' : '' }}">Personal information:</h1>
                            <div class="name-fields" style="{{ $type === 'gift_card' ? 'display:none;' : '' }}">
                                <div class="input-field">
                                    <input type="text" name="name" placeholder="First name" value="{{ $user->name ?? '' }}">
                                    <span id="error-name" class="field-error text-danger"></span>
                                </div>
                                <div class="input-field">
                                    <input type="text" name="last_name" placeholder="Last name" value="{{ $user->last_name ?? '' }}">
                                    <span id="error-last_name" class="field-error text-danger"></span>
                                </div>
                            </div>

                            <div class="name-fields" style="{{ $type === 'gift_card' ? 'display:none;' : '' }}">
                                <div class="input-field">
                                    <input type="text" name="phone" placeholder="Phone number" value="{{ $user->mobile ?? '' }}">
                                    <span id="error-phone" class="field-error text-danger"></span>
                                </div>
                                <div class="input-field">
                                    <input type="text" name="user_email" placeholder="Email" value="{{ $user->email ?? '' }}" @if($user) readonly @endif>
                                    <span id="error-email" class="field-error text-danger"></span>
                                </div>
                            </div>

                            <h1 style="{{ $type === 'gift_card' ? 'display:none;' : '' }}">Delivery Details:</h1>

                            <div class="input-field" style="{{ $type === 'gift_card' ? 'display:none;' : '' }}">
                                <input id="autocomplete" type="text" placeholder="Search your full address">
                                <span id="error-autocomplete" class="field-error text-danger"></span>
                            </div>

                            <div class="name-fields" style="{{ $type === 'gift_card' ? 'display:none;' : '' }}">
                                <div class="input-field">
                                    <input type="text" id="country" name="country" placeholder="Country / Region">
                                    <span id="error-country" class="field-error text-danger"></span>
                                </div>
                                <div class="input-field">
                                    <input type="text" id="city" name="city" placeholder="Town / City">
                                    <span id="error-city" class="field-error text-danger"></span>
                                </div>
                            </div>

                            <div class="name-fields" style="{{ $type === 'gift_card' ? 'display:none;' : '' }}">
                                <div class="input-field">
                                    <input type="text" id="state" name="state" placeholder="State / Province">
                                    <span id="error-state" class="field-error text-danger"></span>
                                </div>
                                <div class="input-field">
                                    <input type="text" id="postcode" name="postcode" placeholder="Postcode">
                                    <span id="error-postcode" class="field-error text-danger"></span>
                                </div>
                            </div>

                            <div class="name-fields" style="{{ $type === 'gift_card' ? 'display:none;' : '' }}">
                                <div class="input-field">
                                    <input type="text" id="street" name="street" placeholder="Street">
                                    <span id="error-street" class="field-error text-danger"></span>
                                </div>
                            </div>

                            <input type="hidden" id="latitude" name="latitude">
                            <input type="hidden" id="longitude" name="longitude">
                            <input type="hidden" id="country_iso" name="country_iso">
                            <input type="hidden" name="formatted_address" id="formatted_address">
                            <input type="hidden" name="province_code" id="province_code">
                            <input type="hidden" name="place_id" id="place_id">
                            <input type="hidden" name="area" id="area">
                            <input type="hidden" name="sub_area" id="sub_area">

                            <h1>Payment:</h1>
                            <div class="payment-types">
                                <div class="payment-type-row">
                                    <label class="custom-radio">
                                        <input type="radio" name="payment_method" value="stripe" checked>
                                        <span class="radiomark"></span>
                                        Stripe
                                    </label>
                                    <div class="right-icon">
                                        <img src="{{ asset('assets/images/stripe_logo.png') }}" alt="">
                                    </div>
                                </div>
                                <div class="payment-type-row">
                                    <label class="custom-radio">
                                        <input type="radio" name="payment_method" value="paypal">
                                        <span class="radiomark"></span>
                                        PayPal
                                    </label>
                                    <div class="right-icon paypal-icon">
                                        <img src="{{ asset('assets/images/paypal.png') }}" alt="">
                                    </div>
                                </div>
                            </div>

                            <div id="paypal-processing" style="display: none; text-align: center; padding: 20px; background: #f8f9fa; border-radius: 8px; margin: 15px 0;">
                                <div style="font-size: 16px; color: #8d5943; margin-bottom: 10px;">
                                    <i class="fas fa-spinner fa-spin"></i> Redirecting to PayPal...
                                </div>
                                <p>Please wait while we prepare your payment.</p>
                            </div>

                            <div class="card-button mb-3">
                                <div class="btn add-card-btn">+ Add Card</div>
                                <div class="btn save-card-btn">Use Saved Card</div>
                            </div>

                            <div class="card-info-fields add-card" id="new-card-section">
                                <div class="input-field card-number-field">
                                    <input type="text" placeholder="Card number" style="display:none;">
                                    <div id="card-number-element" class="stripe-mount form-control border-0 border-bottom rounded-0 shadow-none"></div>
                                    <span id="error-card-number" class="field-error text-danger"></span>
                                </div>

                                <div class="input-field expiration-field" >
                                    <input type="text" placeholder="Expiration date" style="display:none;">
                                    <div id="card-expiry-element" class="stripe-mount form-control border-0 border-bottom rounded-0 shadow-none" ></div>
                                    <span id="error-card-expiry" class="field-error text-danger"></span>
                                </div>

                                <div class="input-field cvv-field" >
                                    <input type="text" placeholder="CVV" style="display:none;">
                                    <div id="card-cvc-element" class="stripe-mount form-control border-0 border-bottom rounded-0 shadow-none"></div>
                                    <span id="error-card-cvc" class="field-error text-danger"></span>
                                </div>

                                <div id="card-errors" class="card-errors text-danger mt-2"></div>

                                <div style="margin-top:10px;" >
                                    <label>
                                        <input type="checkbox" id="save_card" name="save_card" value="1">
                                        Save card for future purchases
                                    </label>
                                </div>
                            </div>

                            <div class="card-info-fields save-card" id="saved-card-section">
                                <label for="saved-cards">Select a saved card:</label>
                                <select id="saved-cards">
                                    @if($user)
                                    <option value="">Select a saved card</option>
                                    @else
                                    <option value="">Sign in to view saved cards</option>
                                    @endif
                                </select>

                                <div class="saved-details" id="card-details">
                                    @if($user)
                                    Select a card to view details
                                    @else
                                    Please sign in to use saved cards.
                                    @endif
                                </div>
                                <span id="error-saved-card" class="field-error text-danger"></span>
                            </div>

                            <div class="promo-section" style="margin-top:12px;">
                                <div class="promo-section promo-back-ground">
                                    <h1>Gift Card</h1>
                                    <div class="promo-field">
                                        <div class="form-group">
                                            <input type="text" name="gift_card_code">
                                            <span id="error-gift_card_code" class="field-error text-danger"></span>
                                        </div>
                                        <div class="btn apply-btn">Apply</div>
                                    </div>
                                </div>

                                <div class="promo-section promo-back-ground" style="margin-top:10px;">
                                    <h1>Rewards & Points</h1>
                                    <div class="reward-container">
                                        @guest
                                        <div class="form-group text-center">
                                            <p>Sign in to redeem Rewards and Free Shipping.</p>
                                            <a href="{{ route('login') }}" class="btn apply-btn">Sign In Or Join</a>
                                        </div>
                                        @else
                                        @if(auth()->user()->total_points > 0)
                                        <div class="reward-box" id="points-box" data-type="points" data-value="{{ auth()->user()->total_points }}">
                                            <img src="{{ asset('assets/images/benifit-1.svg') }}" alt="Points">
                                            <h3>Redeem Points</h3>
                                            <p class="reward-remaining">
                                                You have <strong>{{ auth()->user()->total_points }}</strong> points
                                            </p>
                                        </div>
                                        @endif

                                        @if(auth()->user()->total_shippings > 0)
                                        <div style="display: none important;" class="reward-box" id="shipping-box" data-type="shipping" data-value="{{ auth()->user()->total_shippings }}">
                                            <img src="{{ asset('assets/images/benifit-3.svg') }}" alt="Free Shipping">
                                            <h3>Free Shipping</h3>
                                            <p class="reward-remaining">
                                                You have <strong>{{ auth()->user()->total_shippings }}</strong> shipping credit(s)
                                            </p>
                                        </div>
                                        @endif
                                        @endguest
                                    </div>
                                </div>
                            <div class="terms-checkbox">
                                <input type="checkbox" id="terms_agreement" name="terms_agreement">
                                I agree to the <a href="{{ route('resource') }}" class="link-term" target="_blank">Terms & Conditions</a>
                                and <a href="{{ route('resource') }}" class="link-term" target="_blank">Privacy Policy</a>
                                <div id="terms-error" class="terms-error">Please accept the terms and conditions to proceed</div>
                            </div>
                        </form>

                        <div class="right-cart-items-detail">
                            <h1>Order Summary</h1>
                           <div class="cart-items-total">
                                <p style="{{ $type === 'gift_card' ? 'display:none;' : '' }}">
                                    Sub-total <span id="subtotal-amount">${{ number_format($subTotal, 2) }}</span>
                                </p>
                                <p style="{{ $type === 'gift_card' ? 'display:none;' : '' }}">
                                    Tax (5%) <span id="tax-amount">${{ number_format($tax, 2) }}</span>
                                </p>
                                <p style="{{ $type === 'gift_card' ? 'display:none;' : '' }}">
                                    Delivery charges <span id="delivery-amount">${{ number_format($delivery, 2) }}</span>
                                </p>

                                <p id="us-import-duties-row" class="d-none" style="{{ $type === 'gift_card' ? 'display:none;' : '' }}">
                                    U.S Import Duties & Fees
                                    <span id="us-import-duties-amount">$0.00</span>
                                </p>
                                <p id="discount-row" class="d-none" >
                                    Rewards Discount <span id="discount-amount">-$0.00</span>
                                </p>

                                <p style="{{ $type === 'product' ? 'display:none;' : '' }}">
                                    Gift Card Total Price<span id="gift-card-amount">${{ number_format($giftCardsTotal, 2) }}</span>
                                </p>
                                <p id="applied-gift-card-row" class="d-none d-flex justify-content-between align-items-center">
                                    <span>Applied Gift Card</span>
                                    <span>
                                        <span id="applied-gift-card-amount">-$0.00</span>
                                        <a href="javascript:void(0)" id="remove-gift-card" class="text-danger ms-2">✕</a>
                                    </span>
                                </p>
                            </div>

                            <div class="cart-total-payment">
                                <h1>Total: 
                                    <span id="grand-total">
                                        ${{ number_format($total, 2) }}
                                    </span>
                                </h1>

                                <div class="cart-footer-buttons">
                                    <div class="common-button-light">
                                        <button id="cancelBtn" class="btn cancel-btn">Cancel</button>
                                    </div>
                                    <div class="common-button place-order">
                                        <button type="button" id="placeOrderBtn" class="btn" style="pointer-events: auto; cursor: pointer;">Place order</button>
                                    </div>
                                </div>
                                <div id="checkout-message" style="margin-top:.75rem;"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </x-slot>

    <x-slot name="insertjavascript">
        {{-- Load Google Maps FIRST before any other scripts that might use it --}}
        <script src="https://maps.googleapis.com/maps/api/js?key={{ env('GOOGLE_MAPS_API_KEY', 'YOUR_GOOGLE_MAPS_API_KEY') }}&libraries=places"></script>
        
        @if(config('services.paypal.sandbox_client_id'))
        <script src="https://www.paypal.com/sdk/js?client-id={{ config('services.paypal.sandbox_client_id') }}&currency=USD"></script>
        @endif

        {{-- Define window variables BEFORE loading any scripts --}}
        <script>
            window.STRIPE_KEY = '{{ config("services.stripe.key") ?? env("STRIPE_KEY") }}';
            window.AMOUNT = parseFloat("{{ $total ?? 0 }}") || 0;
            window.TAX = parseFloat("{{ $tax ?? 0 }}") || 0;
            window.SHIPPING_FEE = parseFloat("{{ $delivery ?? 0 }}") || 0;
            window.BASE_SHIPPING_FEE = parseFloat("{{ $delivery ?? 0 }}") || 0;
            window.CURRENCY = 'usd';
            window.GIFT_CARDS_TOTAL = {{ $giftCardsTotal ?? 0 }};
            window.TYPE = '{{ $type ?? '' }}';
            window.appliedGiftCardAmount = 0;
            window.appliedGiftCardCode = '';
            window.appliedGiftCardMax = 0;
            window.APPLIED_GIFT_CARD_META = [];
            window.PRODUCT_META_DATA = @json($product_meta_data ?? []);
            window.GIFT_CARD_META_DATA = @json($gift_card_mata_data ?? []);
            window.BANGLE_BOX_META_DATA = @json($bangle_box_meta_data ?? []);
            window.SUBTOTAL = parseFloat("{{ $subTotal ?? 0 }}") || 0;
        </script>

        {{-- Load Stripe --}}
        <script src="https://js.stripe.com/v3/"></script>
        
        {{-- Load SweetAlert2 --}}
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        
        {{-- Initialize Toast ONCE globally --}}
        <script>
            if (typeof window.Toast === 'undefined') {
                window.Toast = Swal.mixin({
                    toast: true,
                    position: 'top-end',
                    showConfirmButton: false,
                    timer: 3000,
                    timerProgressBar: true
                });
            }
        </script>
        
        {{-- Load checkout script LAST --}}
        <script src="{{ asset('js/checkout.js') }}"></script>
    </x-slot>
</x-layouts.user-default>