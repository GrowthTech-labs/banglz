<x-layouts.user-default>
    <x-slot name="insertstyle">
        <style>
          .pre-order-badge {
            background: #935b08ff;
            color: #fefefeff;
            font-size: 12px;
            padding: 2px 6px;
            border-radius: 4px;
            font-weight: 600;
            white-space: nowrap;
          }

          /* Featured Categories - Sharp corners, no gaps */
          .featured-categories-wrapper {
            position: relative;
            width: 100%;
            overflow: hidden;
            padding: 0;
            margin: 0;
          }
          
          .featured-categories-container {
            display: flex;
            gap: 0;
            overflow-x: hidden;
            scroll-behavior: smooth;
            padding: 0;
            scrollbar-width: none;
            -ms-overflow-style: none;
          }
          
          .featured-categories-container::-webkit-scrollbar {
            display: none;
          }
          
          .featured-category-card {
            flex: 0 0 calc(33.333%);
            min-width: 300px;
            height: 400px;
            position: relative;
            border-radius: 0;
            overflow: hidden;
            text-decoration: none;
            color: white;
            transition: transform 0.3s ease;
            cursor: pointer;
            border: none;
          }
          
          .featured-category-card:hover {
            transform: translateY(-5px);
            z-index: 2;
          }
          
          .featured-category-image {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-size: cover;
            background-position: center;
            transition: transform 0.4s ease;
          }
          
          .featured-category-card:hover .featured-category-image {
            transform: scale(1.05);
          }
          
          .featured-category-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(to top, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0));
          }
          
          .featured-category-content {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            padding: 30px;
            z-index: 2;
          }
          
          .featured-category-content h3 {
            font-size: 1.8rem;
            font-weight: 700;
            margin: 0 0 10px 0;
            color: white;
          }
          
          .featured-category-cta {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            font-size: 1rem;
            color: white;
            transition: gap 0.3s ease;
          }
          
          .featured-category-card:hover .featured-category-cta {
            gap: 12px;
          }
          
          .featured-category-cta img {
            height: 12px;
            filter: brightness(0) invert(1);
          }
          
          /* Navigation Arrows */
          .featured-nav-arrow {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            background: white;
            border: none;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            z-index: 10;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
          }
          
          .featured-nav-arrow:hover {
            background: #8d5943;
            transform: translateY(-50%) scale(1.1);
          }
          
          .featured-nav-arrow img {
            width: 20px;
            height: 20px;
          }
          
          .featured-nav-prev {
            left: 10px;
          }
          
          .featured-nav-next {
            right: 10px;
          }
          
          /* Responsive */
          @media (max-width: 1024px) {
            .featured-category-card {
              flex: 0 0 50%;
              min-width: 280px;
            }
          }
          
          @media (max-width: 768px) {
            .featured-category-card {
              flex: 0 0 100%;
              min-width: 250px;
              height: 350px;
            }
            
            .featured-category-content h3 {
              font-size: 1.5rem;
            }
            
            .featured-nav-arrow {
              width: 40px;
              height: 40px;
            }
          }
        </style>
    </x-slot>
    <x-slot name="content">

        <div class="hero-section">
            <div class="left-hero-section">
                @php
                    $homePage = $pageData->where('page_type', 'home')->first() ?? $pageData->where('page_name', 'home')->first();
                    $meta = $homePage && $homePage->meta_data ? (is_array($homePage->meta_data) ? $homePage->meta_data : json_decode($homePage->meta_data, true)) : [];
                    $hero = $meta['sections']['hero'] ?? [];
                @endphp

                    <div class="left-inner-hero-sec">
                        <h1>{{ $hero['heading'] ?? ($homePage->heading ?? 'Create Bangle box for all Styles') }}</h1>

                        <p>{{ $hero['description'] ?? ($homePage->sub_heading ?? 'Explore our diverse selection of bangles designed for every occasion.') }}</p>

                        <div class="selection-sec">
                            <div class="circle-section">1</div>
                            <p>{{ $hero['size_label'] ?? 'Select Your Size' }}</p>
                            <div class="line-section"></div>
                            <div class="circle-section">2</div>
                            <p>{{ $hero['style_label'] ?? 'Select Your Style' }}</p>
                        </div>

                        <a href="{{ url('banglz-box') }}">
                            {{ $hero['button_label'] ?? 'Start building your bangle box' }}
                        </a>
                    </div>
                </div>


           @php
                $images = [];

                if ($hero && isset($hero['images'])) {
                    $decoded = is_array($hero['images']) ? $hero['images'] : [];
                    if (is_array($decoded) && count($decoded) > 0) {
                        $images = $decoded;
                    }
                } elseif ($homePage && !empty($homePage->images)) {
                    $decoded = json_decode($homePage->images, true);
                    if (is_array($decoded) && count($decoded) > 0) {
                        $images = $decoded;
                    }
                }

                // Default if nothing found
                if (empty($images)) {
                    $images = [
                        ['src' => 'Frame 92.png', 'transform' => ''],
                        ['src' => 'Frame 93.png', 'transform' => ''],
                    ];
                }
            @endphp

            <div class="right-hero-section">
                @foreach($images as $img)
                    <div class="sub-right-hero-section" style="width: {{ count($images) === 1 ? '100%' : '50%' }}">
                        <img src="{{ asset('assets/images/pages/'.$img['src']) }}"
                            alt="Hero image"
                            class="setting-image-thumb"
                            style="transform: {{ $img['transform'] ?? 'none' }};">
                    </div>
                @endforeach
            </div>


        </div>

        <!-- Featured Categories Section - Redesigned -->
        <div class="featured-categories-wrapper">
            <div class="featured-categories-container" id="featured-categories-slider">
                @if (count($featuredCategories) > 0)
                    @foreach ($featuredCategories as $category)
                        @php
                            $categoryImage = 'default.jpg';
                            if ($category->images && is_array($category->images) && count($category->images) > 0) {
                                $categoryImage = $category->images[0];
                            } elseif ($category->image) {
                                $categoryImage = $category->image;
                            }
                            
                            // Build the correct URL based on whether it's a parent or subcategory
                            if ($category->parent_id) {
                                $parent = \App\Models\Category::find($category->parent_id);
                                $categoryUrl = $parent ? route('shop-all', ['slug' => $parent->slug, 'subcategory' => $category->slug]) : route('shop-all', ['slug' => $category->slug]);
                            } else {
                                $categoryUrl = route('shop-all', ['slug' => $category->slug]);
                            }
                        @endphp
                        
                        <a href="{{ $categoryUrl }}" class="featured-category-card">
                            <div class="featured-category-image" style="background-image: url('{{ asset('assets/images/categories/'.$categoryImage) }}');">
                                <div class="featured-category-overlay"></div>
                            </div>
                            <div class="featured-category-content">
                                <h3>{{ $category->name }}</h3>
                                <span class="featured-category-cta">
                                    Shop Now
                                    <img src="{{ asset('assets/images/right-arrow.png') }}" alt="arrow" />
                                </span>
                            </div>
                        </a>
                    @endforeach
                    
                    {{-- Duplicate items for infinite loop --}}
                    @foreach ($featuredCategories as $category)
                        @php
                            $categoryImage = 'default.jpg';
                            if ($category->images && is_array($category->images) && count($category->images) > 0) {
                                $categoryImage = $category->images[0];
                            } elseif ($category->image) {
                                $categoryImage = $category->image;
                            }
                            
                            if ($category->parent_id) {
                                $parent = \App\Models\Category::find($category->parent_id);
                                $categoryUrl = $parent ? route('shop-all', ['slug' => $parent->slug, 'subcategory' => $category->slug]) : route('shop-all', ['slug' => $category->slug]);
                            } else {
                                $categoryUrl = route('shop-all', ['slug' => $category->slug]);
                            }
                        @endphp
                        
                        <a href="{{ $categoryUrl }}" class="featured-category-card">
                            <div class="featured-category-image" style="background-image: url('{{ asset('assets/images/categories/'.$categoryImage) }}');">
                                <div class="featured-category-overlay"></div>
                            </div>
                            <div class="featured-category-content">
                                <h3>{{ $category->name }}</h3>
                                <span class="featured-category-cta">
                                    Shop Now
                                    <img src="{{ asset('assets/images/right-arrow.png') }}" alt="arrow" />
                                </span>
                            </div>
                        </a>
                    @endforeach
                @else
                    <p>No featured categories available.</p>
                @endif
            </div>
            
            <!-- Navigation Arrows -->
            <button class="featured-nav-arrow featured-nav-prev" id="featuredPrev">
                <img src="{{ asset('assets/images/slide-left.png') }}" alt="Previous">
            </button>
            <button class="featured-nav-arrow featured-nav-next" id="featuredNext">
                <img src="{{ asset('assets/images/slide-right.png') }}" alt="Next">
            </button>
        </div>


        <div class="all-products-main">
            <div class="product-section">
                <h2>Products</h2>

                <!-- Tabs -->
                <div class="tabs">
                    @foreach ($tabsWithProducts as $index => $tab)
                    <button class="tab @if($index === 0) active @endif" data-category="{{ $tab['slug'] }}">
                        {{ $tab['name'] }}
                    </button>
                    @endforeach
                </div>

                <!-- Sliders -->
                <div class="all-carousels">
                    @foreach ($tabsWithProducts as $index => $tab)
                  <div class="carousel-wrapper @if($index === 0) active @endif" data-category="{{ $tab['slug'] }}">
                    <div class="carousel-container">

                        <!-- Left Arrow -->
                        <button class="nav prev">
                            <img src="{{ asset('assets/images/slide-left.png') }}" alt="Prev">
                        </button>

                        <!-- Product Items -->
                        <div class="carousel">
                            @forelse ($tab['products'] as $product)
                            <div class="card position-card">
                                <a href="{{ route('product.detail', $product->slug) }}">
                                    <img src="{{ asset('assets/images/products/' . ($product->images[0] ?? 'default.jpg')) }}" alt="{{ $product->name }}">
                                </a>
                                @php
    $inWishlist = false;

    if (auth()->check()) {
        $inWishlist = \App\Models\WishList::where('user_id', auth()->id())
            ->where('product_id', $product->id)
            ->exists();
    }
@endphp
                                    <div class="whist-list-button">
                                        <img
  src="{{ asset($inWishlist ? 'assets/images/heart-filled.png' : 'assets/images/heart.png') }}"
  alt="Wishlist"
  class="api-wishlist-button"
  data-product-id="{{ $product->id }}"
/>

        <!-- <img src="{{ asset('assets/images/heart.png') }}"
             alt="Wishlist"
             class="api-wishlist-button"
             data-product-id="{{ $product->id }}"/> -->
    </div>
                        <!-- @if($product->variations->count() > 0)
    {{-- Product has variations → redirect to details --}}
    <div class="whist-list-button"
         onclick="window.location.href='{{ route('product.detail', $product->slug) }}'">
        <img src="{{ asset('assets/images/heart.png') }}" alt="Wishlist"/>
    </div>
@else
    {{-- Product has no variations → use API wishlist toggle --}}
    <div class="whist-list-button">
        <img src="{{ asset('assets/images/heart.png') }}"
             alt="Wishlist"
             class="api-wishlist-button"
             data-product-id="{{ $product->id }}"/>
    </div>
@endif -->


                                <div class="card-content">
                                    <h4>{{ $product->name }}</h4>
                                    <!-- <p>{{ Str::limit($product->description, 40) }}</p> -->
                      <span>
    @php
        $userLoggedIn = auth()->check();

        // Base product/variation prices
        $basePrice    = $product->price ?? ($product->variations->first()->price ?? null);
        $memberPrice  = $product->member_price ?? ($product->variations->first()->member_price ?? null);
        $comparePrice = $product->compare_price ?? ($product->variations->first()->compare_price ?? null);
    @endphp

    @if($userLoggedIn)
        @if($memberPrice)
            <span class="text-muted text-decoration-line-through">
                ${{ number_format($basePrice, 2) }}
            </span>
            <span class="fw-bold">
                ${{ number_format($memberPrice, 2) }}
            </span>
        @elseif($comparePrice) {{-- Case 2: logged in, no member price but has compare price --}}
            <span class="text-muted text-decoration-line-through">
                ${{ number_format($basePrice, 2) }}
            </span>
            <span class="fw-bold">
                ${{ number_format($comparePrice, 2) }}
            </span>
        @elseif($basePrice)
            <span class="fw-bold">
                ${{ number_format($basePrice, 2) }}
            </span>
        @else
            <span>N/A</span>
        @endif
    @else {{-- User not logged in --}}
        @if($comparePrice)
            <span class="text-muted text-decoration-line-through">
                ${{ number_format($basePrice, 2) }}
            </span>
            <span class="fw-bold">
                ${{ number_format($comparePrice, 2) }}
            </span>
        @elseif($basePrice)
            <span class="fw-bold">
                ${{ number_format($basePrice, 2) }}
            </span>
        @else
            <span>N/A</span>
        @endif
    @endif

</span>
<div class="add-action-buttons add">
    @if($product->variations && $product->variations->isNotEmpty())
        <button
            class="add-to-bundle"
            onclick="window.location.href='{{ route('product.detail', $product->slug) }}'"
            @if($product->is_pre_order) style="display:none;" @endif>
            Add to Bundle
        </button>
        <button
            class="add-to-card"
            onclick="window.location.href='{{ route('product.detail', $product->slug) }}'">
            {{ $product->is_pre_order ? 'Add to Pre-Order' : 'Add to Cart' }}
        </button>
    @else
        <button
            class="add-to-bundle btn-add-bundle-product"
            data-product-id="{{ $product->id }}"
            @if($product->is_pre_order) style="display:none;" @endif>
            Add to Bundle
        </button>
        <button
            class="add-to-card btn-add-to-cart"
            data-type="product"
            data-type-id="{{ $product->id }}">
            {{ $product->is_pre_order ? 'Add to Pre-Order' : 'Add to Cart' }}
        </button>
    @endif
</div>


 <!-- <div class="add-action-buttons  add">
    @if($product->variations && $product->variations->isNotEmpty())
        <button
            class="add-to-bundle"
            onclick="window.location.href='{{ route('product.detail', $product->slug) }}'">
            Add to Bundle
        </button>
        <button
            class="add-to-card"
            onclick="window.location.href='{{ route('product.detail', $product->slug) }}'">
            Add to Cart
        </button>
    @else
        <button
            class="add-to-bundle btn-add-bundle-product"
            data-product-id="{{ $product->id }}">
            Add to Bundle
        </button>
        <button
            class="add-to-card btn-add-to-cart"
            data-type="product"
            data-type-id="{{ $product->id }}">
            Add to Cart
        </button>
    @endif
</div> -->
                                </div>
                            </div>
                            @empty
                            <p>No products found.</p>
                            @endforelse
                        </div>

                        <!-- Right Arrow -->
                        <button class="nav next">
                            <img src="{{ asset('assets/images/slide-right.png') }}" alt="Next">
                        </button>
                    </div>

                    <!-- Pagination dots -->
                    <div class="dots-container"></div>
                </div>
                    @endforeach
                </div>

                <!-- Bottom Button -->

            </div>
        </div>



        <!-- Collection section -->
       <div class="category-slider category-section">
        @foreach ($collections ?? [] as $collection)

            <div  onclick="window.location='{{ route('catalog', $collection->slug) }}'"
            class="category-iner-section"
                style="
                    background-image:
                        linear-gradient(to top, rgba(0,0,0,0.3), rgba(0,0,0,0)),
                        url('{{ asset('assets/images/collections/' . ($collection->images[0] ?? 'default.jpg')) }}');
                    background-size: cover;
                    background-position: center;
                    background-repeat: no-repeat;
                ">
                <div class="category-content-two">
                    <span>Discover</span>
                    <h1>{{ $collection->name }}</h1>
                    <p>{{ Str::limit($collection->description ?? 'Explore our collection', 100) }}</p>
                    <a href="{{ route('catalog', $collection->slug) }}">Shop Now</a>
                </div>
            </div>
        @endforeach

    </div>



        @php
            $customize = $meta['sections']['customize'] ?? null;
        @endphp
        <div class="container">
                {{-- banglez box --}}
                <div class="Customize-section">
                    <div class="customize-sec-content">
                        <h1>{{ $customize['heading1'] ?? 'Create bangle box for all styles' }}</h1>
                        <p>{{ $customize['desc1'] ?? 'Select pieces marked with the Complete Your Look tag to build your perfect set. Add three eligible items and unlock exclusive perks, including free styling services and more.' }}</p>
                    </div>
                    <div class="customize-card-main video-servies">
                        <div class="row">
                            @php
                                $cards = $customize['cards'] ?? [];
                            @endphp
                            @for($i=0;$i<3;$i++)
                            @php
                                $card = $cards[$i] ?? [];
                                $cardImg = isset($card['image']) ? asset('assets/images/pages/'.$card['image']) : null;
                            @endphp
                            <div class="col-12 col-md-6 col-lg-4 mt-3">
                                <div class="category-iner-section" style="background-image: url('{{ $cardImg ?? asset('assets/images/about-head.jpg') }}'); background-size: cover; background-position: center;">
                                    <div class="category-content-two">
                                        <h1>{{ $card['title'] ?? 'Choose your Stack' }}</h1>
                                        <p>{{ $card['sub'] ?? 'Pick 6 or 9 bangles from over 250 colors to create your own custom set.' }}</p>
                                    </div>
                                </div>
                            </div>
                            @endfor

                        </div>

                        <div class="complete-look-btn">
                            <a href="{{ url('banglz-box') }}">
                                Start building your bangle box
                            </a>
                        </div>
                    </div>
                </div>

                {{-- customization Buttons --}}
                <div class="Customize-section">
                    <div class="customize-sec-content">
                        <h1>{{ $customize['heading2'] ?? 'Bundle your Look. Unlock Rewards' }}</h1>
                        <p>{{ $customize['desc2'] ?? 'Select pieces marked with the Complete Your Look tag to build your perfect set. Add three eligible items and unlock exclusive perks, including free styling services and more.' }}</p>
                    </div>
                </div>
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

        {{-- appointment section --}}
        @php
            $appointmentsData = $pageData->firstWhere('page_type', 'appointments');
            $appointmentsHeading = $appointmentsData->heading ?? 'Book Your Personal Appointment';
            $appointmentsDescription = $appointmentsData->description ?? 'Book your personal appointment for styling and personalized consultation';
            $allAppointments = $appointmentsData->meta_data['appointments'] ?? [];
            // Filter out empty appointments
            $appointments = array_filter($allAppointments, function($apt) {
                return !empty($apt['title']) && !empty($apt['description']);
            });
        @endphp
        
        <div class="appointment-section-main">
            <div class="appointment-section-head">
                <h1>{{ $appointmentsHeading }}</h1>
                <p>{{ $appointmentsDescription }}</p>
            </div>
         <div class="appointment-slider">
                @forelse($appointments as $appointment)
                <div class="product-card">
                    <div class="product-card-img">
                        <img src="{{ asset('assets/images/' . ($appointment['image'] ?? 'ear.jpg')) }}" alt="{{ $appointment['title'] ?? '' }}">
                    </div>
                    <div class="product-content">
                        <h3 class="product-title">{{ $appointment['title'] ?? '' }}</h3>
                        <p class="product-desc">
                            {{ $appointment['description'] ?? '' }}
                        </p>
                        <a href="{{ $appointment['link'] ?? url('appointment') }}" class="product-link">
                            Start building
                            <span>
                                <img src="{{ asset('assets/images/right-b-arrow.png') }}" alt="">
                            </span>
                        </a>
                    </div>
                </div>
                @empty
                {{-- Fallback if no appointments data --}}
                <div class="product-card">
                    <div class="product-card-img">
                        <img src="{{ asset('assets/images/ear.jpg') }}" alt="">
                    </div>
                    <div class="product-content">
                        <h3 class="product-title">CUSTOM BANGLE SET</h3>
                        <p class="product-desc">
                            Create your perfect bangle set with our expert guidance.
                        </p>
                        <a href="{{ url('appointment') }}" class="product-link">
                            Start building
                            <span>
                                <img src="{{ asset('assets/images/right-b-arrow.png') }}" alt="">
                            </span>
                        </a>
                    </div>
                </div>
                @endforelse
            </div>

        </div>



    </x-slot>
    <x-slot name="insertjavascript">
       <script>
// Infinite loop slider for featured categories (no glitch)
document.addEventListener('DOMContentLoaded', function() {
    const container = document.getElementById('featured-categories-slider');
    const prevBtn = document.getElementById('featuredPrev');
    const nextBtn = document.getElementById('featuredNext');
    
    if (!container || !prevBtn || !nextBtn) return;
    
    const cards = container.querySelectorAll('.featured-category-card');
    const totalCards = cards.length / 2; // We duplicated the items
    let isAutoScrolling = true;
    let autoScrollInterval;
    let isScrolling = false;
    
    // Calculate scroll amount based on visible cards
    function getScrollAmount() {
        const containerWidth = container.clientWidth;
        const cardWidth = cards[0].offsetWidth;
        const visibleCards = Math.floor(containerWidth / cardWidth);
        return visibleCards * cardWidth;
    }
    
    // Check if we need to reset position (seamless loop)
    function checkScrollPosition() {
        const scrollLeft = container.scrollLeft;
        const cardWidth = cards[0].offsetWidth;
        const halfwayPoint = cardWidth * totalCards;
        
        // If we've scrolled past the original items, reset to beginning
        if (scrollLeft >= halfwayPoint) {
            container.scrollLeft = scrollLeft - halfwayPoint;
        }
        // If we've scrolled before the beginning, jump to end
        else if (scrollLeft <= 0) {
            container.scrollLeft = halfwayPoint;
        }
    }
    
    // Manual scroll with buttons
    prevBtn.addEventListener('click', function() {
        isAutoScrolling = false;
        clearInterval(autoScrollInterval);
        
        container.scrollBy({
            left: -getScrollAmount(),
            behavior: 'smooth'
        });
        
        setTimeout(() => { 
            isAutoScrolling = true;
            startAutoScroll();
        }, 3000);
    });
    
    nextBtn.addEventListener('click', function() {
        isAutoScrolling = false;
        clearInterval(autoScrollInterval);
        
        container.scrollBy({
            left: getScrollAmount(),
            behavior: 'smooth'
        });
        
        setTimeout(() => { 
            isAutoScrolling = true;
            startAutoScroll();
        }, 3000);
    });
    
    // Auto-scroll function
    function startAutoScroll() {
        if (autoScrollInterval) clearInterval(autoScrollInterval);
        
        autoScrollInterval = setInterval(function() {
            if (!isAutoScrolling || isScrolling) return;
            
            isScrolling = true;
            
            // Scroll to next set of cards
            container.scrollBy({
                left: getScrollAmount(),
                behavior: 'smooth'
            });
            
            // Wait for scroll to finish, then check position
            setTimeout(() => {
                checkScrollPosition();
                isScrolling = false;
            }, 600); // Match smooth scroll duration
            
        }, 3000); // Scroll every 3 seconds
    }
    
    // Initialize: Start at the beginning of original items
    const cardWidth = cards[0].offsetWidth;
    container.scrollLeft = 0;
    
    // Start auto-scroll
    startAutoScroll();
    
    // Pause on hover
    container.addEventListener('mouseenter', function() {
        isAutoScrolling = false;
    });
    
    container.addEventListener('mouseleave', function() {
        isAutoScrolling = true;
    });
    
    prevBtn.addEventListener('mouseenter', function() {
        isAutoScrolling = false;
    });
    
    prevBtn.addEventListener('mouseleave', function() {
        isAutoScrolling = true;
    });
    
    nextBtn.addEventListener('mouseenter', function() {
        isAutoScrolling = false;
    });
    
    nextBtn.addEventListener('mouseleave', function() {
        isAutoScrolling = true;
    });
});
</script>



    </x-slot>
</x-layouts.user-default>

</html>
