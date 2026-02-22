<?php

namespace App\Http\Controllers;

use App\Models\Collection;
use Illuminate\Http\Request;

class CatalogController extends Controller
{
  public function catalog($slug)
  {
    $collection = Collection::where('slug', $slug)
                            ->with(['collectionCategories' => function($query) {
                                $query->where('status', 1)
                                      ->with('category')
                                      ->orderBy('display_order');
                            }])
                            ->firstOrFail();
    
    // Get products for this collection grouped by category
    $products = \App\Models\Product::whereHas('collection', function($query) use ($collection) {
                    $query->where('collection_id', $collection->id);
                })
                ->where('status', 1)
                ->with(['category', 'variations'])
                ->get()
                ->groupBy('category_id');
    
    return view('pages.catalog', compact('collection', 'products'));
  }
}
