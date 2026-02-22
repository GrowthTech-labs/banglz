<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Collection extends Model
{
    use HasFactory , SoftDeletes;
    protected $fillable = [
        'name',
        'slug',
        'description',
        'status',
        'images',
    ];
        protected $casts = [
        'images' => 'array',
    ];

public function products()
{
    return $this->belongsToMany(Product::class, 'collection_products', 'collection_id', 'product_id');
}

public function categories()
{
    return $this->belongsToMany(Category::class, 'collection_categories', 'collection_id', 'category_id')
                ->withPivot('title', 'description', 'images', 'display_order', 'status')
                ->withTimestamps()
                ->orderBy('display_order');
}

public function collectionCategories()
{
    return $this->hasMany(CollectionCategory::class);
}
}
