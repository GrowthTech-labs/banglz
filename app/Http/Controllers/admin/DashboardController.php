<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Collection;
use App\Models\Product;
use App\Models\Order;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class DashboardController extends Controller
{
   public function dashboard()
   {
      // Basic counts
      $productsCount = Product::count(); 
      $categoryCount = Category::count();
      $collectionsCount = Collection::count();
      $topProducts = Product::with('category')->orderBy('id', 'desc')->take(5)->get();
      
      // Order statistics
      $totalOrders = Order::count();
      $todayOrders = Order::whereDate('created_at', Carbon::today())->count();
      $weekOrders = Order::whereBetween('created_at', [Carbon::now()->startOfWeek(), Carbon::now()->endOfWeek()])->count();
      $monthOrders = Order::whereMonth('created_at', Carbon::now()->month)
                          ->whereYear('created_at', Carbon::now()->year)
                          ->count();
      
      // Revenue statistics
      $totalRevenue = Order::where('payment_status', 'paid')->sum('total_amount');
      $todayRevenue = Order::where('payment_status', 'paid')
                           ->whereDate('created_at', Carbon::today())
                           ->sum('total_amount');
      $monthRevenue = Order::where('payment_status', 'paid')
                           ->whereMonth('created_at', Carbon::now()->month)
                           ->whereYear('created_at', Carbon::now()->year)
                           ->sum('total_amount');
      
      // Get daily orders for last 30 days
      $dailyOrders = Order::select(
          DB::raw('DATE(created_at) as date'),
          DB::raw('COUNT(*) as count'),
          DB::raw('SUM(total_amount) as revenue')
      )
      ->where('created_at', '>=', Carbon::now()->subDays(30))
      ->groupBy('date')
      ->orderBy('date', 'asc')
      ->get();
      
      // Get monthly orders for last 12 months
      $monthlyOrders = Order::select(
          DB::raw('DATE_FORMAT(created_at, "%Y-%m") as month'),
          DB::raw('COUNT(*) as count'),
          DB::raw('SUM(total_amount) as revenue')
      )
      ->where('created_at', '>=', Carbon::now()->subMonths(12))
      ->groupBy('month')
      ->orderBy('month', 'asc')
      ->get();
      
      // Get yearly orders for last 5 years
      $yearlyOrders = Order::select(
          DB::raw('YEAR(created_at) as year'),
          DB::raw('COUNT(*) as count'),
          DB::raw('SUM(total_amount) as revenue')
      )
      ->where('created_at', '>=', Carbon::now()->subYears(5))
      ->groupBy('year')
      ->orderBy('year', 'asc')
      ->get();
      
      // Top selling products (based on order frequency)
      $topSellingProducts = DB::table('orders')
          ->select('products_meta_data')
          ->where('payment_status', 'paid')
          ->get()
          ->flatMap(function($order) {
              $products = json_decode($order->products_meta_data, true);
              if (isset($products['Products'])) {
                  return collect($products['Products'])->map(function($item) {
                      return [
                          'name' => $item['product']['name'] ?? 'Unknown',
                          'quantity' => $item['qty'] ?? $item['quantity'] ?? 1,
                          'price' => $item['product']['price'] ?? 0
                      ];
                  });
              }
              return [];
          })
          ->groupBy('name')
          ->map(function($group) {
              return [
                  'name' => $group->first()['name'],
                  'total_quantity' => $group->sum('quantity'),
                  'total_revenue' => $group->sum(function($item) {
                      return $item['quantity'] * $item['price'];
                  })
              ];
          })
          ->sortByDesc('total_quantity')
          ->take(5)
          ->values();
      
    return view('admin.dashboard.dashboard', [
        'productsCount' => $productsCount > 0 ? $productsCount : '-',
        'categoryCount' => $categoryCount > 0 ? $categoryCount : '-',
        'collectionsCount' => $collectionsCount > 0 ? $collectionsCount : '-',
        'topProducts' => $topProducts,
        'totalOrders' => $totalOrders,
        'todayOrders' => $todayOrders,
        'weekOrders' => $weekOrders,
        'monthOrders' => $monthOrders,
        'totalRevenue' => $totalRevenue,
        'todayRevenue' => $todayRevenue,
        'monthRevenue' => $monthRevenue,
        'dailyOrders' => $dailyOrders,
        'monthlyOrders' => $monthlyOrders,
        'yearlyOrders' => $yearlyOrders,
        'topSellingProducts' => $topSellingProducts,
    ]);
   }
}
