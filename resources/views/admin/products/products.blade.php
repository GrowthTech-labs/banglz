@extends('components.layouts.admin-default')
<link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap4.min.css">

<style>
/* Mobile Card Layout for Products */
@media (max-width: 767px) {
    /* Hide table on mobile */
    .client-table #detail-table_wrapper {
        display: none !important;
    }
    
    .client-table .row.g-2 {
        display: none !important;
    }
    
    /* Show mobile card view */
    #mobile-products-view {
        display: block !important;
    }
    
    .mobile-view-container {
        display: block !important;
    }
    
    .product-card {
        background: #fff;
        border-radius: 8px;
        padding: 15px;
        margin-bottom: 15px;
        box-shadow: 0 2px 6px rgba(0,0,0,0.1);
    }
    
    .product-card-header {
        display: flex;
        justify-content: space-between;
        align-items: start;
        margin-bottom: 12px;
        padding-bottom: 12px;
        border-bottom: 2px solid #6cc2b6;
    }
    
    .product-card-title {
        font-size: 16px;
        font-weight: bold;
        color: #333;
        flex: 1;
        margin-right: 10px;
    }
    
    .product-card-body {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 10px;
        margin-bottom: 12px;
    }
    
    .product-card-field {
        display: flex;
        flex-direction: column;
    }
    
    .product-card-label {
        font-size: 11px;
        color: #666;
        text-transform: uppercase;
        font-weight: 600;
        margin-bottom: 3px;
    }
    
    .product-card-value {
        font-size: 14px;
        color: #333;
        font-weight: 500;
    }
    
    .product-card-actions {
        display: flex;
        gap: 8px;
        flex-wrap: wrap;
        padding-top: 10px;
        border-top: 1px solid #eee;
    }
    
    .product-card-actions .btn {
        flex: 1;
        min-width: 80px;
        font-size: 13px;
        padding: 6px 10px;
    }
    
    .badge-bangle {
        display: inline-block;
        padding: 3px 8px;
        border-radius: 12px;
        font-size: 11px;
        font-weight: 600;
    }
    
    .badge-yes {
        background: #d4edda;
        color: #155724;
    }
    
    .badge-no {
        background: #f8d7da;
        color: #721c24;
    }
}

/* Desktop: hide mobile view */
@media (min-width: 768px) {
    #mobile-products-view {
        display: none !important;
    }
}

.mobile-view-container {
    display: none;
}

@media (max-width: 767px) {
    .mobile-view-container {
        display: block !important;
    }
}
</style>

@section('content')
@include('components.includes.admin.navbar')
<main class="content-wrapper">

    <div class="container-fluid py-3">
         <div class="heading-top d-flex justify-content-between align-items-center">
        <h1 class="mb-0">All Products</h1>
        <a href="{{ route('admin.products.create') }}" class="btn text-white " style="background-color: #6cc2b6; border-color: #6cc2b6;">+ Add New Products</a>
    </div>
        </div>
        
        <!-- Desktop Table View -->
        <div class="client-table pt-2">
            <div class="row g-2 align-items-center mb-3">
                <div class="col-1">
                    <label for="searchInput" class="col-form-label">Search:</label>
                </div>
                <div class="col-11">
                    <input type="text" id="searchInput" class="form-control form-control-sm" placeholder="Search Products...">
                </div>
            </div>
            <table id="detail-table" style="width: 100%" >
                <thead>
                    <tr>
                        <th class="table-heading">Name</th>
                        <th class="table-heading">Price</th>
                        <th class="table-heading">Available QTY</th>
                        <th class="table-heading">Unavailable QTY</th>
                        <th class="table-heading">Commited QTY</th>
                        <th class="table-heading">On hand QTY</th>
                        <th class="table-heading">Bangle</th>
                        <th class="table-heading">Category</th>
                        <th class="table-heading">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr></tr>
                </tbody>
            </table>
        </div>
        
        <!-- Mobile Card View -->
        <div id="mobile-products-view" class="mobile-view-container">
            <div class="mb-3">
                <input type="text" id="mobileSearchInput" class="form-control" placeholder="Search Products...">
            </div>
            <div id="mobile-products-container">
                <!-- Products will be loaded here via JavaScript -->
            </div>
            <div id="mobile-loading" class="text-center py-4">
                <div class="spinner-border text-primary" role="status">
                    <span class="visually-hidden">Loading...</span>
                </div>
                <p class="mt-2">Loading products...</p>
            </div>
            <div id="mobile-pagination" class="d-flex justify-content-center mt-3">
                <!-- Pagination will be added here -->
            </div>
        </div>
    </div>

    <form id="delete-form" method="POST" style="display: none;">
        @csrf
        @method('DELETE')
    </form>
</main>

@endsection

@section('admininsertjavascript')
<script>
    $('body').addClass('bg-clr')
</script>
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
    $(document).ready(function() {
        var isMobile = $(window).width() < 768;
        console.log('Screen width:', $(window).width(), 'isMobile:', isMobile);
        
        var table;
        var mobileCurrentPage = 1;
        var mobilePageSize = 10;
        var mobileSearchTerm = '';
        
        if (!isMobile) {
            // Desktop DataTable
            console.log('Initializing desktop table');
            table = $('#detail-table').DataTable({
                processing: true,
                serverSide: true,
                ajax: {
                    url: "{{ route('admin .get-products-list') }}",
                    type: 'GET',
                    data: function(d) {
                        d.search = $('#searchInput').val();
                        if (d.order && d.order.length > 0) {
                            d.sort_by = d.columns[d.order[0].column].name;
                            d.sort_dir = d.order[0].dir;
                        } else {
                            d.sort_by = 'id';
                            d.sort_dir = 'desc';
                        }
                    }
                },
                columns: [
                    { data: 'name', name: 'name', orderable: true },
                    { data: 'price', name: 'price', orderable: true },
                    { data: 'available_quantity', name: 'available_quantity', orderable: false },
                    { data: 'unavailable_quantity', name: 'unavailable_quantity', orderable: true },
                    { data: 'commited_quantity', name: 'commited_quantity', orderable: false },
                    { data: 'on_hand_quantity', name: 'on_hand_quantity', orderable: false },
                    { data: 'is_bangle', name: 'is_bangle', orderable: false },
                    { data: 'category', name: 'category', orderable: false },
                    { data: 'action', name: 'action', orderable: false }
                ],
                dom: 't<"row justify-content-end"<"col-sm-12 col-md-5"p>>',
                pageLength: 10,
                lengthChange: false,
                searching: false,
                ordering: true,
                order: [],
                info: false,
                autoWidth: false,
                responsive: true,
                language: {
                    processing: '<div class="spinner-border text-primary" role="status"><span class="visually-hidden">Loading...</span></div>',
                    emptyTable: "No Product found",
                    zeroRecords: "No Product found"
                }
            });

            var searchTimer;
            $('#searchInput').on('keyup', function() {
                clearTimeout(searchTimer);
                searchTimer = setTimeout(function() {
                    table.ajax.reload();
                }, 500);
            });
        } else {
            // Mobile Card View
            console.log('Initializing mobile view');
            $('#mobile-products-view').show();
            
            // Use DataTables API but render as cards
            table = $('#detail-table').DataTable({
                processing: true,
                serverSide: true,
                ajax: {
                    url: "{{ route('admin .get-products-list') }}",
                    type: 'GET',
                    data: function(d) {
                        d.search = $('#mobileSearchInput').val();
                        d.sort_by = 'id';
                        d.sort_dir = 'desc';
                    }
                },
                columns: [
                    { data: 'name', name: 'name' },
                    { data: 'price', name: 'price' },
                    { data: 'available_quantity', name: 'available_quantity' },
                    { data: 'unavailable_quantity', name: 'unavailable_quantity' },
                    { data: 'commited_quantity', name: 'commited_quantity' },
                    { data: 'on_hand_quantity', name: 'on_hand_quantity' },
                    { data: 'is_bangle', name: 'is_bangle' },
                    { data: 'category', name: 'category' },
                    { data: 'action', name: 'action' }
                ],
                pageLength: 10,
                lengthChange: false,
                searching: false,
                ordering: false,
                info: false,
                drawCallback: function(settings) {
                    var api = this.api();
                    var data = api.rows({page: 'current'}).data();
                    
                    $('#mobile-loading').hide();
                    
                    if (data.length > 0) {
                        var html = '';
                        data.each(function(product) {
                            html += createProductCard(product);
                        });
                        $('#mobile-products-container').html(html);
                    } else {
                        $('#mobile-products-container').html('<div class="text-center py-4"><p>No products found</p></div>');
                    }
                    
                    // Update pagination
                    updateMobilePagination(api);
                }
            });
            
            var mobileSearchTimer;
            $('#mobileSearchInput').on('keyup', function() {
                clearTimeout(mobileSearchTimer);
                mobileSearchTimer = setTimeout(function() {
                    table.ajax.reload();
                }, 500);
            });
        }
        
        function updateMobilePagination(api) {
            var info = api.page.info();
            var currentPage = info.page + 1;
            var totalPages = info.pages;
            
            if (totalPages <= 1) {
                $('#mobile-pagination').html('');
                return;
            }
            
            var html = '<nav><ul class="pagination pagination-sm">';
            html += `<li class="page-item ${currentPage === 1 ? 'disabled' : ''}">
                        <a class="page-link mobile-page-link" href="#" data-page="${currentPage - 2}">Previous</a>
                     </li>`;
            
            var startPage = Math.max(1, currentPage - 2);
            var endPage = Math.min(totalPages, startPage + 4);
            
            if (endPage - startPage < 4) {
                startPage = Math.max(1, endPage - 4);
            }
            
            for (var i = startPage; i <= endPage; i++) {
                html += `<li class="page-item ${i === currentPage ? 'active' : ''}">
                            <a class="page-link mobile-page-link" href="#" data-page="${i - 1}">${i}</a>
                         </li>`;
            }
            
            html += `<li class="page-item ${currentPage === totalPages ? 'disabled' : ''}">
                        <a class="page-link mobile-page-link" href="#" data-page="${currentPage}">Next</a>
                     </li>`;
            html += '</ul></nav>';
            
            $('#mobile-pagination').html(html);
            
            $('.mobile-page-link').on('click', function(e) {
                e.preventDefault();
                if (!$(this).parent().hasClass('disabled') && !$(this).parent().hasClass('active')) {
                    var page = parseInt($(this).data('page'));
                    table.page(page).draw('page');
                    $('html, body').animate({ scrollTop: 0 }, 300);
                }
            });
        }
        
        function createProductCard(product) {
            var bangleBadge = product.is_bangle === 'Yes' ? 
                '<span class="badge-bangle badge-yes">Yes</span>' : 
                '<span class="badge-bangle badge-no">No</span>';
            
            return `
                <div class="product-card">
                    <div class="product-card-header">
                        <div class="product-card-title">${product.name}</div>
                    </div>
                    <div class="product-card-body">
                        <div class="product-card-field">
                            <span class="product-card-label">Price</span>
                            <span class="product-card-value">${product.price}</span>
                        </div>
                        <div class="product-card-field">
                            <span class="product-card-label">Available QTY</span>
                            <span class="product-card-value">${product.available_quantity}</span>
                        </div>
                        <div class="product-card-field">
                            <span class="product-card-label">Unavailable QTY</span>
                            <span class="product-card-value">${product.unavailable_quantity}</span>
                        </div>
                        <div class="product-card-field">
                            <span class="product-card-label">Committed QTY</span>
                            <span class="product-card-value">${product.commited_quantity}</span>
                        </div>
                        <div class="product-card-field">
                            <span class="product-card-label">On Hand QTY</span>
                            <span class="product-card-value">${product.on_hand_quantity}</span>
                        </div>
                        <div class="product-card-field">
                            <span class="product-card-label">Bangle</span>
                            <span class="product-card-value">${bangleBadge}</span>
                        </div>
                        <div class="product-card-field" style="grid-column: 1 / -1;">
                            <span class="product-card-label">Category</span>
                            <span class="product-card-value">${product.category}</span>
                        </div>
                    </div>
                    <div class="product-card-actions">
                        ${product.action}
                    </div>
                </div>
            `;
        }
    });

    function confirmDelete(id) {
        Swal.fire({
            title: 'Are you sure?',
            text: "This product will be deleted!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#6c757d',
            confirmButtonText: 'Yes, delete it!',
            reverseButtons: true
        }).then((result) => {
            if (result.isConfirmed) {
                const url = "{{ route('product.delete', ':id') }}".replace(':id', id);
                fetch(url, {
                    method: 'delete',
                    headers: {
                        'X-CSRF-TOKEN': '{{ csrf_token() }}',
                        'Accept': 'application/json'
                    }
                })
                .then(response => response.json())
                .then(data => {
                    if (data.status) {
                        Swal.fire('Deleted!', 'Product has been deleted.', 'success')
                        .then(() => location.reload());
                    } else {
                        Swal.fire('Error!', 'Something went wrong.', 'error');
                    }
                })
                .catch(() => Swal.fire('Error!', 'Something went wrong.', 'error'));
            }
        });
    }
</script>

<script>
    $('.sidenav  li:nth-of-type(2)').addClass('active');
</script>
@endsection
