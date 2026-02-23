@extends('components.layouts.admin-default')

@section('content')
@include('components.includes.admin.navbar')
<main class="content-wrapper">
    <div class="container-fluid py-3">
        <div class="heading-top d-flex justify-content-between align-items-center">
            <h1 class="mb-0">Countries</h1>
            <a href="{{ route('admin.countries.create') }}" class="btn text-white" style="background-color: #6cc2b6; border-color: #6cc2b6;">+ Add New Country</a>
        </div>

        @if(session('success'))
            <div class="alert alert-success alert-dismissible fade show mt-3" role="alert">
                {{ session('success') }}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        @endif

        <!-- Desktop Table View -->
        <div class="client-table product-table mt-3">
            <div class="row mb-3">
                <div class="col-1">
                    <i class="fa fa-search"></i>
                </div>
                <div class="col-11">
                    <input type="text" id="searchInput" class="form-control form-control-sm" placeholder="Search Countries...">
                </div>
            </div>

            <table id="countries-table" class="detail-client-table">
                <thead>
                    <tr>
                        <th class="table-heading">Code</th>
                        <th class="table-heading">Name</th>
                        <th class="table-heading">Status</th>
                        <th class="table-heading">Sort Order</th>
                        <th class="table-heading">Action</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($countries as $country)
                        <tr data-code="{{ $country->code }}" 
                            data-name="{{ $country->name }}" 
                            data-status="{{ $country->is_active ? 'Active' : 'Inactive' }}" 
                            data-status-class="{{ $country->is_active ? 'bg-success' : 'bg-danger' }}"
                            data-sort="{{ $country->sort_order }}"
                            data-id="{{ $country->id }}">
                            <td>{{ $country->code }}</td>
                            <td>{{ $country->name }}</td>
                            <td>
                                <span class="badge {{ $country->is_active ? 'bg-success' : 'bg-danger' }}">
                                    {{ $country->is_active ? 'Active' : 'Inactive' }}
                                </span>
                            </td>
                            <td>{{ $country->sort_order }}</td>
                            <td>
                                <a href="{{ route('admin.countries.edit', $country->id) }}">
                                    <button type="button" class="btn btn-info">Edit</button>
                                </a>
                                <button type="button" class="btn btn-danger" onclick="confirmDelete({{ $country->id }})">Delete</button>
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="5" class="text-center">No countries found</td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
        
        <!-- Mobile Card View -->
        <div id="mobile-countries-view" class="mobile-view-container mt-3" style="display: none;">
            <div class="mb-3">
                <input type="text" id="mobileSearchInput" class="form-control" placeholder="Search Countries...">
            </div>
            <div id="mobile-countries-container">
                <!-- Countries will be loaded here via JavaScript -->
            </div>
        </div>
    </div>
</main>
@endsection

@section('admininsertjavascript')
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    $('.sidenav li').removeClass('active');
    $('.sidenav li:has(a[href="{{ route('admin.countries.index') }}"])').addClass('active');

    // Check if mobile view
    function isMobile() {
        return $(window).width() < 768;
    }

    // Create mobile card
    function createCountryCard(country) {
        var statusBadgeClass = country.statusClass === 'bg-success' ? 'badge-active' : 'badge-inactive';
        var statusBadge = `<span class="badge-category ${statusBadgeClass}">${country.status}</span>`;
        
        return `
            <div class="country-card">
                <div class="country-card-header">
                    <div class="country-card-title">${country.name}</div>
                </div>
                <div class="country-card-body">
                    <div class="country-card-field">
                        <span class="country-card-label">Code</span>
                        <span class="country-card-value">${country.code}</span>
                    </div>
                    <div class="country-card-field">
                        <span class="country-card-label">Status</span>
                        <span class="country-card-value">${statusBadge}</span>
                    </div>
                    <div class="country-card-field">
                        <span class="country-card-label">Sort Order</span>
                        <span class="country-card-value">${country.sortOrder}</span>
                    </div>
                </div>
                <div class="country-card-actions">
                    <a href="{{ route('admin.countries.edit', ':id') }}".replace(':id', ${country.id})>
                        <button type="button" class="btn btn-info">Edit</button>
                    </a>
                    <button type="button" class="btn btn-danger" onclick="confirmDelete(${country.id})">Delete</button>
                </div>
            </div>
        `;
    }

    // Load mobile cards
    function loadMobileCards(searchTerm = '') {
        var cards = '';
        var hasResults = false;
        
        $('#countries-table tbody tr').each(function() {
            var $row = $(this);
            var code = $row.data('code');
            var name = $row.data('name');
            var status = $row.data('status');
            var statusClass = $row.data('status-class');
            var sortOrder = $row.data('sort');
            var id = $row.data('id');
            
            if (!code) return; // Skip empty rows
            
            // Filter by search term
            if (searchTerm) {
                var rowText = (code + ' ' + name + ' ' + status + ' ' + sortOrder).toLowerCase();
                if (rowText.indexOf(searchTerm.toLowerCase()) === -1) {
                    return;
                }
            }
            
            hasResults = true;
            cards += createCountryCard({
                code: code,
                name: name,
                status: status,
                statusClass: statusClass,
                sortOrder: sortOrder,
                id: id
            });
        });
        
        if (!hasResults) {
            cards = '<div class="text-center py-4"><p>No countries found</p></div>';
        }
        
        $('#mobile-countries-container').html(cards);
    }

    // Initialize view
    function initializeView() {
        if (isMobile()) {
            $('.client-table').hide();
            $('#mobile-countries-view').show();
            loadMobileCards();
        } else {
            $('.client-table').show();
            $('#mobile-countries-view').hide();
        }
    }

    // Desktop search functionality
    $('#searchInput').on('keyup', function() {
        var value = $(this).val().toLowerCase();
        $('#countries-table tbody tr').filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
    });

    // Mobile search functionality
    $('#mobileSearchInput').on('keyup', function() {
        var value = $(this).val();
        loadMobileCards(value);
    });

    // Handle window resize
    var resizeTimer;
    var lastWidth = $(window).width();
    
    $(window).on('resize', function() {
        clearTimeout(resizeTimer);
        resizeTimer = setTimeout(function() {
            var currentWidth = $(window).width();
            var currentIsMobile = currentWidth < 768;
            var lastIsMobile = lastWidth < 768;
            
            // Only reinitialize if mobile state changed
            if (currentIsMobile !== lastIsMobile) {
                initializeView();
            }
            
            lastWidth = currentWidth;
        }, 250);
    });

    // Initialize on page load
    $(document).ready(function() {
        initializeView();
    });

    function confirmDelete(id) {
        Swal.fire({
            title: 'Are you sure?',
            text: "This country will be deleted!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#6c757d',
            confirmButtonText: 'Yes, delete it!',
            reverseButtons: true
        }).then((result) => {
            if (result.isConfirmed) {
                const url = "{{ route('admin.countries.destroy', ':id') }}".replace(':id', id);
                
                fetch(url, {
                    method: 'DELETE',
                    headers: {
                        'X-CSRF-TOKEN': '{{ csrf_token() }}',
                        'Accept': 'application/json'
                    }
                })
                .then(response => response.json())
                .then(data => {
                    Swal.fire(
                        'Deleted!',
                        'Country has been deleted.',
                        'success'
                    ).then(() => {
                        location.reload();
                    });
                })
                .catch(() => {
                    Swal.fire(
                        'Error!',
                        'Something went wrong.',
                        'error'
                    );
                });
            }
        });
    }
</script>
@endsection
