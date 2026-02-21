<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Product extends Model
{
    use HasFactory , SoftDeletes;
// use fillable to allow mass assignment
    protected $fillable = [
        'name',
        'description',
        'price',
        'compare_price',
        'sku',
        'quantity',
        'images', // Add this line
        'attributes',
        'status',
        'slug',
        'category_id',
        'is_featured',
        'care',
        'sustainability',
        'shipping',
        'returns',
        'member_price',
        'colors',
        'unavailable_quantity',
        'is_top_listed',
        'category_box_id',
        'size',
        'color_id',
        'meta_title',
        'meta_description',
        'images_details',
        'is_pre_order',
        'weight',
        'weight_unit',
        'country_of_origin',
        'hs_code'
    ];

    protected $casts = [
        'images' => 'array',
    ];
    public function tags()
    {
        return $this->belongsToMany(Tag::class, 'product_tags', 'product_id', 'tag_id');
    }
    public function collection()
    {
        return $this->belongsToMany(Collection::class, 'collection_products', 'product_id', 'collection_id');
    }
    public function variations()
{
    return $this->hasMany(ProductVariation::class);
}
    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function vendor()
    {
        return $this->belongsTo(User::class, 'vendor_id');
    }

    public function scopeFilter($query, array $filters)
    {
        if ($filters['search'] ?? false) {
            $query->where('name', 'like', '%' . request('search') . '%');
        }
    }
    public function bundleProducts(){
        return $this->hasMany(BundleProduct::class);
    }

    public function color(){
        return $this->belongsTo(ProductColor::class);
    }

    /**
     * Get the first image with fallback to default
     */
    public function getFirstImageAttribute()
    {
        $images = $this->images;
        
        // Handle if images is null or empty
        if (empty($images) || !is_array($images)) {
            return 'default.jpg';
        }
        
        $firstImage = $images[0];
        
        // Check if file exists
        $imagePath = public_path('assets/images/products/' . $firstImage);
        if (file_exists($imagePath)) {
            return $firstImage;
        }
        
        // Fallback to default
        return 'default.jpg';
    }

    /**
     * Get all valid images with fallback
     */
    public function getValidImagesAttribute()
    {
        $images = $this->images;
        
        if (empty($images) || !is_array($images)) {
            return ['default.jpg'];
        }
        
        $validImages = [];
        foreach ($images as $image) {
            $imagePath = public_path('assets/images/products/' . $image);
            if (file_exists($imagePath)) {
                $validImages[] = $image;
            }
        }
        
        // If no valid images found, return default
        return empty($validImages) ? ['default.jpg'] : $validImages;
    }

    /**
     * Get image URL with fallback
     */
    public function getImageUrl($index = 0)
    {
        $images = $this->valid_images;
        $image = $images[$index] ?? $images[0] ?? 'default.jpg';
        return asset('assets/images/products/' . $image);
    }

}
