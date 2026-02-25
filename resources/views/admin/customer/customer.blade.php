@extends('components.layouts.admin-default')
<link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap4.min.css">
@section('content')
@include('components.includes.admin.navbar')
<main class="content-wrapper">

    <div class="container-fluid py-3">
        <div class="heading-top d-flex justify-content-between align-items-center">
            <h1 class="mb-0">All Customers</h1>
            <!-- <a href="{{ route('admin.blog.create') }}" class="btn text-white " style="background-color: #6cc2b6; border-color: #6cc2b6;">+ Add Blog</a> -->
        </div>
    </div>
    
    <!-- Desktop Table View -->
    <div class="client-table pt-2">
        <div class="row g-2 align-items-center mb-3">
            <div class="col-1">
                <label for="searchInput" class="col-form-label">Search:</label>
            </div>
            <div class="col-11">
                <input type="text" id="searchInput" class="form-control form-control-sm" placeholder="Search Customers...">
            </div>
        </div>
        <table id="customer-table" style="width: 100%">
            <thead>
                <tr>
                    <th class="table-heading">Customer ID</th>
                    <th class="table-heading">First Name</th>
                    <th class="table-heading">Last Name</th>
                    <th class="table-heading">email</th>
                    <th class="table-heading">Customer Type</th>
                    <th class="table-heading">Action</th>
                </tr>
            </thead>
            <tbody>
                <tr></tr>
            </tbody>
        </table>
    </div>
    
    <!-- Mobile Card View -->
    <div id="mobile-customers-view" class="mobile-view-container">
        <div class="mb-3">
            <input type="text" id="mobileSearchInput" class="form-control" placeholder="Search Customers...">
        </div>
        <div id="mobile-customers-container">
            <!-- Customers will be loaded here via JavaScript -->
        </div>
        <div id="mobile-loading" class="text-center py-4">
            <div class="spinner-border text-primary" role="status">
                <span class="visually-hidden">Loading...</span>
            </div>
            <p class="mt-2">Loading customers...</p>
        </div>
        <div id="mobile-pagination" class="d-flex justify-content-center mt-3">
            <!-- Pagination will be added here -->
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
{{-- <script src="https://code.jquery.com/jquery-3.5.1.js"></script> --}}
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
    $(document).ready(function() {
        var table;
        var isInitialized = false;
        
        function initializeTable() {
            var isMobile = $(window).width() < 768;
            console.log('Initializing table, screen width:', $(window).width(), 'isMobile:', isMobile);
            
            // Destroy existing table if it exists
            if (isInitialized && $.fn.DataTable.isDataTable('#customer-table')) {
                console.log('Destroying existing table');
                table.destroy();
                // Rebuild table structure
                $('#customer-table').html(`
                    <thead>
                        <tr>
                            <th>Customer ID</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>email</th>
                            <th>Customer Type</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                `);
            }
            
            // Show/hide appropriate views before initialization
            if (isMobile) {
                $('#mobile-customers-view').show();
                $('#mobile-loading').show();
                $('#mobile-customers-container').html('');
                $('.client-table').hide();
            } else {
                $('#mobile-customers-view').hide();
                $('#mobile-loading').hide();
                $('#mobile-customers-container').html('');
                $('.client-table').show();
            }
            
            var tableConfig = {
                processing: true,
                serverSide: true,
                ajax: {
                    url: "{{ route('admin.get-customers-list') }}",
                    type: 'GET',
                    data: function(d) {
                        d.search = isMobile ? $('#mobileSearchInput').val() : $('#searchInput').val();
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
                    { data:'customer_id', name:'customer_id', orderable: true },
                    { data: 'name', name: 'name', orderable: false },
                    { data: 'last_name', name: 'last_name', orderable: false },
                    { data: 'email', name: 'email', orderable: false },
                    { data:'is_guest', name:'is_guest', orderable: false },
                    { data: 'action', name: 'action', orderable: false, searchable: false }
                ],
                dom: 't<"row justify-content-end"<"col-sm-12 col-md-5"p>>',
                pageLength: 10,
                lengthChange: false,
                searching: false,
                ordering: !isMobile,
                order: [],
                info: false,
                autoWidth: false,
                responsive: true,
                language: {
                    processing: '<div class="spinner-border text-primary" role="status"><span class="visually-hidden">Loading...</span></div>',
                    emptyTable: "No Customer found",
                    zeroRecords: "No Customer found"
                }
            };
            
            // Add mobile-specific callback
            if (isMobile) {
                tableConfig.drawCallback = function(settings) {
                    var api = this.api();
                    var data = api.rows({page: 'current'}).data();
                    
                    console.log('Mobile drawCallback triggered, data length:', data.length);
                    $('#mobile-loading').hide();
                    
                    if (data.length > 0) {
                        var html = '';
                        data.each(function(customer) {
                            html += createCustomerCard(customer);
                        });
                        $('#mobile-customers-container').html(html);
                    } else {
                        $('#mobile-customers-container').html('<div class="text-center py-4"><p>No customers found</p></div>');
                    }
                    
                    updateMobilePagination(api);
                };
                
                tableConfig.initComplete = function(settings, json) {
                    console.log('Mobile table init complete, data:', json);
                    $('#mobile-loading').hide();
                    
                    // Ensure drawCallback fires on init
                    if (json && json.data && json.data.length > 0) {
                        var html = '';
                        json.data.forEach(function(customer) {
                            html += createCustomerCard(customer);
                        });
                        $('#mobile-customers-container').html(html);
                        updateMobilePagination(this.api());
                    } else {
                        $('#mobile-customers-container').html('<div class="text-center py-4"><p>No customers found</p></div>');
                    }
                };
            }
            
            table = $('#customer-table').DataTable(tableConfig);
            isInitialized = true;
            
            console.log('Table initialized');
            
            // Setup search handlers
            var searchTimer;
            if (isMobile) {
                $('#mobileSearchInput').off('keyup').on('keyup', function() {
                    clearTimeout(searchTimer);
                    searchTimer = setTimeout(function() {
                        $('#mobile-loading').show();
                        table.ajax.reload();
                    }, 500);
                });
            } else {
                $('#searchInput').off('keyup').on('keyup', function() {
                    clearTimeout(searchTimer);
                    searchTimer = setTimeout(function() {
                        table.ajax.reload();
                    }, 500);
                });
            }
        }
        
        function createCustomerCard(customer) {
            // Parse customer type badge
            var customerTypeBadge = '';
            if (customer.is_guest) {
                // Strip HTML tags if present
                var tempDiv = document.createElement('div');
                tempDiv.innerHTML = customer.is_guest;
                var badgeText = tempDiv.textContent || tempDiv.innerText || customer.is_guest;
                
                if (badgeText.toLowerCase().includes('guest')) {
                    customerTypeBadge = '<span class="badge-category badge-inactive">Guest</span>';
                } else if (badgeText.toLowerCase().includes('registered')) {
                    customerTypeBadge = '<span class="badge-category badge-active">Registered</span>';
                } else {
                    customerTypeBadge = badgeText;
                }
            } else {
                customerTypeBadge = 'N/A';
            }
            
            return `
                <div class="customer-card">
                    <div class="customer-card-header">
                        <div>
                            <div class="customer-card-title">${customer.name || 'N/A'} ${customer.last_name || ''}</div>
                            <div class="customer-card-id">ID: ${customer.customer_id || 'N/A'}</div>
                        </div>
                    </div>
                    <div class="customer-card-body">
                        <div class="customer-card-field full-width">
                            <span class="customer-card-label">Email</span>
                            <span class="customer-card-value">${customer.email || 'N/A'}</span>
                        </div>
                        <div class="customer-card-field">
                            <span class="customer-card-label">Customer Type</span>
                            <span class="customer-card-value">${customerTypeBadge}</span>
                        </div>
                    </div>
                    <div class="customer-card-actions">
                        ${customer.action}
                    </div>
                </div>
            `;
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
            
            $('.mobile-page-link').off('click').on('click', function(e) {
                e.preventDefault();
                if (!$(this).parent().hasClass('disabled') && !$(this).parent().hasClass('active')) {
                    var page = parseInt($(this).data('page'));
                    table.page(page).draw('page');
                    $('html, body').animate({ scrollTop: 0 }, 300);
                }
            });
        }
        
        // Initialize on page load
        initializeTable();
        
        // Handle window resize with debounce
        var resizeTimer;
        var lastWidth = $(window).width();
        
        $(window).on('resize', function() {
            clearTimeout(resizeTimer);
            resizeTimer = setTimeout(function() {
                var currentWidth = $(window).width();
                var currentIsMobile = currentWidth < 768;
                var lastIsMobile = lastWidth < 768;
                
                console.log('Resize check - Current width:', currentWidth, 'Last width:', lastWidth);
                
                // Only reinitialize if mobile state changed
                if (currentIsMobile !== lastIsMobile) {
                    console.log('Screen size crossed breakpoint, reinitializing...');
                    
                    // Show loader immediately for mobile
                    if (currentIsMobile) {
                        $('#mobile-customers-view').show();
                        $('#mobile-loading').show();
                        $('#mobile-customers-container').html('');
                    }
                    
                    // Reinitialize table
                    initializeTable();
                }
                
                lastWidth = currentWidth;
            }, 250);
        });
    });
</script>

<script>
</script>
@endsection