<x-layouts.user-default>
    <x-slot name="insertstyle">
    </x-slot>
    <x-slot name="content">
        <div class="product-detail-main-wrapper top-paddings-set">
            <div class="catalog-hero-section">
                <div class="catalog-hero-content">
                    <div class="catalog-left">
                        <h1>
                            {{ $collection->name ?? 'Catalog' }}
                        </h1>
                        <!-- <h1>MOTHER’S
                            <br>
                            DAY
                            <br>
                            GUIDE</h1> -->
                    </div>
                    <div class="catelog-right">
                        <img src="{{ asset('assets/images/collections/'.($collection->images[0] ?? 'default.jpg')) }}" alt="missing"/>
                    </div>
                </div>
            </div>

            {{-- detail about us --}}
            <div class="catalog-tabs">
                    <ul id="catologTabs" class="custom-tabs catalog-ul ">
                        @foreach($collection->collectionCategories as $index => $categoryConfig)
                            <li class="{{ $index === 0 ? 'active' : '' }}" data-tab="TAB-{{ $categoryConfig->category_id }}">
                                {{ strtoupper($categoryConfig->category->name) }}
                            </li>
                        @endforeach
                    </ul>

                    <div class="tab-content">
                        @foreach($collection->collectionCategories as $index => $categoryConfig)
                            <div class="tab-main tab-pane catalog-pane {{ $index === 0 ? 'active' : '' }}" id="TAB-{{ $categoryConfig->category_id }}">
                                <div class="tabs-main-content container">
                                    @if($categoryConfig->title || $categoryConfig->description)
                                        <div class="tabs-head-content">
                                            @if($categoryConfig->title)
                                                <h1>{{ $categoryConfig->title }}</h1>
                                            @endif
                                            @if($categoryConfig->description)
                                                <p>{{ $categoryConfig->description }}</p>
                                            @endif
                                        </div>
                                    @endif
                                    
                                    <div class="custom-slider">
                                        @php
                                            $categoryImages = $categoryConfig->images ?? [];
                                            $categoryProducts = $products->get($categoryConfig->category_id, collect());
                                        @endphp
                                        
                                        @if(count($categoryImages) > 0)
                                            @foreach($categoryImages as $imgIndex => $img)
                                                @if($imgIndex === 0)
                                                    <!-- Half height card -->
                                                    <div class="card half-card">
                                                        <div class="img-wrap">
                                                            <img src="{{ asset('assets/images/collection_categories/' . $img) }}" alt="{{ $categoryConfig->title }}">
                                                            <button class="gift-btn"><img src="{{asset('assets/images/gift.png')}}" alt="gift icon"/></button>
                                                        </div>
                                                    </div>
                                                @else
                                                    <!-- Full height cards -->
                                                    <div class="card tall-card">
                                                        <img src="{{ asset('assets/images/collection_categories/' . $img) }}" alt="{{ $categoryConfig->title }}">
                                                        <button class="gift-btn"><i class="fas fa-gift"></i></button>
                                                    </div>
                                                @endif
                                            @endforeach
                                        @else
                                            <!-- Fallback: show product images if no category images -->
                                            @foreach($categoryProducts->take(4) as $prodIndex => $product)
                                                @if($prodIndex === 0)
                                                    <div class="card half-card">
                                                        <div class="img-wrap">
                                                            <img src="{{ $product->getImageUrl(0) }}" alt="{{ $product->name }}">
                                                            <button class="gift-btn"><img src="{{asset('assets/images/gift.png')}}" alt="gift icon"/></button>
                                                        </div>
                                                    </div>
                                                @else
                                                    <div class="card tall-card">
                                                        <img src="{{ $product->getImageUrl(0) }}" alt="{{ $product->name }}">
                                                        <button class="gift-btn"><i class="fas fa-gift"></i></button>
                                                    </div>
                                                @endif
                                            @endforeach
                                        @endif
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
            </div>

                <div class="product-slider container">
                    @php
                        $allProducts = $products->flatten()->take(10);
                    @endphp
                    
                    @forelse($allProducts as $product)
                        <div class="product-card-catalog">
                            <div class="product-image">
                                <img src="{{ $product->getImageUrl(0) }}" alt="{{ $product->name }}">
                                @if($product->is_featured)
                                    <span class="gift-tag">
                                        <img src="{{asset('assets/images/bag.png')}}" alt="icon"/> Featured Gift
                                    </span>
                                @endif
                            </div>
                            <div class="product-info">
                                <h4 class="product-name">{{ $product->name }}</h4>
                                <p class="product-variant">{{ $product->category->name ?? '' }}</p>
                                <span class="product-price">${{ number_format($product->price, 2) }}</span>
                                @if($product->compare_price && $product->compare_price > $product->price)
                                    <span class="product-compare-price" style="text-decoration: line-through; color: #999; margin-left: 5px;">
                                        ${{ number_format($product->compare_price, 2) }}
                                    </span>
                                @endif
                                <a href="{{ route('product.detail', $product->slug) }}" class="add-to-cart">View Product</a>
                            </div>
                        </div>
                    @empty
                        <div class="col-12 text-center py-5">
                            <p class="text-muted">No products available in this collection yet.</p>
                        </div>
                    @endforelse
                </div>



                 {{-- feedback-section --}}
            <div class="userfeed-back-section">
                <h1>What our Customers Say</h1>
                
            @if (config('services.yotpo.app_key'))
                <div class="yotpo yotpo-reviews-carousel"
                     data-background-color="transparent"
                     data-mode="top_rated"
                     data-type="site"
                     data-count="8"
                     data-show-bottomline="true"
                     data-autoplay-enabled="true">
                </div>
            @else
            <div class="slider center">
                <div class="first slider-card">
                    <div class="slider-main-imager">
                        <img src="{{ asset('assets/images/quates.png') }}" alt="missing">
                    </div>
                    <div class="start-images">
                        <img src="{{ asset('assets/images/star.png') }}" alt="missing">
                        <img src="{{ asset('assets/images/star.png') }}" alt="missing">
                        <img src="{{ asset('assets/images/star.png') }}" alt="missing">
                        <img src="{{ asset('assets/images/star.png') }}" alt="missing">
                        <img src="{{ asset('assets/images/star.png') }}" alt="missing">
                    </div>
                    <h1>"The customization options are simply amazing!"</h1>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse varius enim in eros elementum tristique. Duis cursus, mi quis viverra ornare, eros dolor interdum nulla.</p>
                    <div class="user-info">
                        <div class="feed-user-image">
                            <img src="{{ asset('assets/images/fake-user.png') }}" alt="missing">
                        </div>
                        <h2>Name</h2>
                    </div>
                </div>
                <div class="first1 slider-card">
                    <div class="slider-main-imager">
                        <img src="{{ asset('assets/images/quates.png') }}" alt="missing">
                    </div>
                    <div class="start-images">
                        <img src="{{ asset('assets/images/star.png') }}" alt="missing">
                        <img src="{{ asset('assets/images/star.png') }}" alt="missing">
                        <img src="{{ asset('assets/images/star.png') }}" alt="missing">
                        <img src="{{ asset('assets/images/star.png') }}" alt="missing">
                        <img src="{{ asset('assets/images/star.png') }}" alt="missing">
                    </div>
                    <h1>"The customization options are simply amazing!"</h1>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse varius enim in eros elementum tristique. Duis cursus, mi quis viverra ornare, eros dolor interdum nulla.</p>
                    <div class="user-info">
                        <div class="feed-user-image">
                            <img src="{{ asset('assets/images/fake-user.png') }}" alt="missing">
                        </div>
                        <h2>Name</h2>
                    </div>
                </div>
                <div class="first2 slider-card">
                    <div class="slider-main-imager">
                        <img src="{{ asset('assets/images/quates.png') }}" alt="missing">
                    </div>
                    <div class="start-images">
                        <img src="{{ asset('assets/images/star.png') }}" alt="missing">
                        <img src="{{ asset('assets/images/star.png') }}" alt="missing">
                        <img src="{{ asset('assets/images/star.png') }}" alt="missing">
                        <img src="{{ asset('assets/images/star.png') }}" alt="missing">
                        <img src="{{ asset('assets/images/star.png') }}" alt="missing">
                    </div>
                    <h1>"The customization options are simply amazing!"</h1>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse varius enim in eros elementum tristique. Duis cursus, mi quis viverra ornare, eros dolor interdum nulla.</p>
                    <div class="user-info">
                        <div class="feed-user-image">
                            <img src="{{ asset('assets/images/fake-user.png') }}" alt="missing">
                        </div>
                        <h2>Name</h2>
                    </div>
                </div>
                <div class="first3 slider-card">
                    <div class="slider-main-imager">
                        <img src="{{ asset('assets/images/quates.png') }}" alt="missing">
                    </div>
                    <div class="start-images">
                        <img src="{{ asset('assets/images/star.png') }}" alt="missing">
                        <img src="{{ asset('assets/images/star.png') }}" alt="missing">
                        <img src="{{ asset('assets/images/star.png') }}" alt="missing">
                        <img src="{{ asset('assets/images/star.png') }}" alt="missing">
                        <img src="{{ asset('assets/images/star.png') }}" alt="missing">
                    </div>
                    <h1>"The customization options are simply amazing!"</h1>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse varius enim in eros elementum tristique. Duis cursus, mi quis viverra ornare, eros dolor interdum nulla.</p>
                    <div class="user-info">
                        <div class="feed-user-image">
                            <img src="{{ asset('assets/images/fake-user.png') }}" alt="missing">
                        </div>
                        <h2>Name</h2>
                    </div>
                </div>
                <div class="first4 slider-card">
                    <div class="slider-main-imager">
                        <img src="{{ asset('assets/images/quates.png') }}" alt="missing">
                    </div>
                    <div class="start-images">
                        <img src="{{ asset('assets/images/star.png') }}" alt="missing">
                        <img src="{{ asset('assets/images/star.png') }}" alt="missing">
                        <img src="{{ asset('assets/images/star.png') }}" alt="missing">
                        <img src="{{ asset('assets/images/star.png') }}" alt="missing">
                        <img src="{{ asset('assets/images/star.png') }}" alt="missing">
                    </div>
                    <h1>"The customization options are simply amazing!"</h1>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse varius enim in eros elementum tristique. Duis cursus, mi quis viverra ornare, eros dolor interdum nulla.</p>
                    <div class="user-info">
                        <div class="feed-user-image">
                            <img src="{{ asset('assets/images/fake-user.png') }}" alt="missing">
                        </div>
                        <h2>Name</h2>
                    </div>
                </div>
                <div class="first5 slider-card">
                    <div class="slider-main-imager">
                        <img src="{{ asset('assets/images/quates.png') }}" alt="missing">
                    </div>
                    <div class="start-images">
                        <img src="{{ asset('assets/images/star.png') }}" alt="missing">
                        <img src="{{ asset('assets/images/star.png') }}" alt="missing">
                        <img src="{{ asset('assets/images/star.png') }}" alt="missing">
                        <img src="{{ asset('assets/images/star.png') }}" alt="missing">
                        <img src="{{ asset('assets/images/star.png') }}" alt="missing">
                    </div>
                    <h1>"The customization options are simply amazing!"</h1>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse varius enim in eros elementum tristique. Duis cursus, mi quis viverra ornare, eros dolor interdum nulla.</p>
                    <div class="user-info">
                        <div class="feed-user-image">
                            <img src="{{ asset('assets/images/fake-user.png') }}" alt="missing">
                        </div>
                        <h2>Name</h2>
                    </div>
                </div>
            </div>
            @endif
            </div>







        </div>
    </x-slot>
    <x-slot name="insertjavascript">
        <script>
            document.querySelectorAll('.custom-tabs li').forEach(tab => {
                tab.addEventListener('click', function() {
                // Remove active from all tabs
                document.querySelectorAll('.custom-tabs li').forEach(t => t.classList.remove('active'));
                // Remove active from all panes
                document.querySelectorAll('.tab-pane').forEach(p => p.classList.remove('active'));

                // Activate the clicked tab
                this.classList.add('active');
                // Show the related pane
                document.getElementById(this.dataset.tab).classList.add('active');
                });
            });
            </script>
            <script>
                function toggleSection(el) {
                    const options = el.nextElementSibling;
                    const sign = el.querySelector("span");
                    if (options.style.display === "block") {
                        options.style.display = "none";
                        sign.textContent = "+";
                    } else {
                        options.style.display = "block";
                        sign.textContent = "–";
                    }
                }

                function clearAll() {
                    document.querySelectorAll('.filter-options input[type="checkbox"]').forEach(cb => cb.checked = false);
                }
            </script>

    </x-slot>
</x-layouts.user-default>
</html>
