@extends('components.layouts.admin-default')

@section('content')
@include('components.includes.admin.navbar')
<main class="content-wrapper">
    <div class="container-fluid py-3">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2>Add New Country</h2>
            <a href="{{ route('admin.countries.index') }}" class="btn text-white" style="background-color: #6cc2b6; border-color: #6cc2b6;">← Back</a>
        </div>

        <div class="card">
            <div class="card-body">
                @if(session('error'))
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        {{ session('error') }}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                @endif
                
                @if(session('success'))
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        {{ session('success') }}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                @endif
                
                <form action="{{ route('admin.countries.store') }}" method="POST">
                    @csrf
                    
                    <div class="mb-3">
                        <label for="code" class="form-label">Country Code (2 letters) <span class="text-danger">*</span></label>
                        <input type="text" class="form-control @error('code') is-invalid @enderror" 
                               id="code" name="code" value="{{ old('code') }}" maxlength="2" required style="text-transform: uppercase;">
                        @error('code')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                        <small class="text-muted">Example: US, CA, GB</small>
                    </div>

                    <div class="mb-3">
                        <label for="name" class="form-label">Country Name <span class="text-danger">*</span></label>
                        <input type="text" class="form-control @error('name') is-invalid @enderror" 
                               id="name" name="name" value="{{ old('name') }}" required>
                        @error('name')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>

                    <div class="mb-3">
                        <label for="sort_order_display" class="form-label">Sort Order (Auto-generated)</label>
                        <input type="text" class="form-control" id="sort_order_display" value="Loading..." readonly>
                        <input type="hidden" name="sort_order" id="sort_order" value="">
                        <small class="text-muted">Automatically assigned. Lower numbers appear first in dropdown</small>
                    </div>

                    <div class="mb-3 form-check">
                        <input type="checkbox" class="form-check-input" id="is_active" name="is_active" 
                               {{ old('is_active', true) ? 'checked' : '' }}>
                        <label class="form-check-label" for="is_active">Active (Show in signup dropdown)</label>
                    </div>

                    <button type="submit" class="btn text-white" style="background-color: #6cc2b6; border-color: #6cc2b6;">Create Country</button>
                </form>
            </div>
        </div>
    </div>
</main>
@endsection

@section('admininsertjavascript')
<script>
    $('.sidenav li').removeClass('active');
    $('.sidenav li:has(a[href="{{ route('admin.countries.index') }}"])').addClass('active');
    
    // Auto-fill sort order on page load
    $(document).ready(function() {
        fetch('{{ route('admin.countries.nextSortOrder') }}')
            .then(response => response.json())
            .then(data => {
                $('#sort_order').val(data.next_sort_order);
                $('#sort_order_display').val(data.next_sort_order);
            })
            .catch(error => {
                console.error('Error fetching next sort order:', error);
                $('#sort_order').val(1);
                $('#sort_order_display').val(1);
            });
    });
</script>
@endsection
