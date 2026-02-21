<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Country;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class CountryController extends Controller
{
    public function index()
    {
        $countries = Country::orderBy('sort_order')->orderBy('name')->get();
        return view('admin.countries.index', compact('countries'));
    }

    public function create()
    {
        return view('admin.countries.create');
    }

    public function store(Request $request)
    {
        try {
            \Log::info('Country store method called', ['data' => $request->all()]);
            
            $validator = Validator::make($request->all(), [
                'code' => 'required|string|size:2|unique:countries,code',
                'name' => 'required|string|max:255',
                'is_active' => 'boolean',
                'sort_order' => 'nullable|integer|min:0',
            ]);

            if ($validator->fails()) {
                \Log::warning('Country validation failed', ['errors' => $validator->errors()]);
                return redirect()->back()->withErrors($validator)->withInput();
            }

            // Auto-generate sort_order if not provided
            $sortOrder = $request->sort_order;
            if ($sortOrder === null || $sortOrder === '') {
                $maxSortOrder = Country::max('sort_order') ?? 0;
                $sortOrder = $maxSortOrder + 1;
            }

            $country = Country::create([
                'code' => strtoupper($request->code),
                'name' => $request->name,
                'is_active' => $request->has('is_active'),
                'sort_order' => $sortOrder,
            ]);

            \Log::info('Country created successfully', ['country' => $country]);
            
            return redirect()->route('admin.countries.index')->with('success', 'Country created successfully');
        } catch (\Exception $e) {
            \Log::error('Country creation failed: ' . $e->getMessage(), ['trace' => $e->getTraceAsString()]);
            return redirect()->back()->with('error', 'Failed to create country: ' . $e->getMessage())->withInput();
        }
    }

    public function edit($id)
    {
        $country = Country::findOrFail($id);
        return view('admin.countries.edit', compact('country'));
    }

    public function update(Request $request, $id)
    {
        $country = Country::findOrFail($id);

        $validator = Validator::make($request->all(), [
            'code' => 'required|string|size:2|unique:countries,code,' . $id,
            'name' => 'required|string|max:255',
            'is_active' => 'boolean',
            'sort_order' => 'integer|min:0',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $country->update([
            'code' => strtoupper($request->code),
            'name' => $request->name,
            'is_active' => $request->has('is_active'),
            'sort_order' => $request->sort_order ?? 0,
        ]);

        return redirect()->route('admin.countries.index')->with('success', 'Country updated successfully');
    }

    public function destroy($id)
    {
        $country = Country::findOrFail($id);
        $country->delete();

        return response()->json(['status' => true, 'message' => 'Country deleted successfully']);
    }

    public function getNextSortOrder()
    {
        $maxSortOrder = Country::max('sort_order') ?? 0;
        return response()->json(['next_sort_order' => $maxSortOrder + 1]);
    }
}
