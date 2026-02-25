@extends('components.layouts.admin-default')
<link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap4.min.css">

@section('content')
@include('components.includes.admin.navbar')
<main class="content-wrapper">

    <div class="container-fluid py-3">

        <!-- Page Header -->
        <div class="d-flex justify-content-between align-items-center mb-4">
            <!-- <a href="{{ route('admin.customers.list') }}" class="btn btn-secondary btn-sm">← Back to Users</a> -->
        </div>

        <!-- Orders Table -->
        <div class="card shadow-sm">
            <div class="card-header bg-light fw-bold">
                All Orders
            </div>
            <div class="card-body">
                <div class="row g-2 align-items-center mb-3">
                    <div class="col-1">
                        <label for="searchInput" class="col-form-label">Search:</label>
                    </div>
                    <div class="col-11">
                        <input type="text" id="searchInput" class="form-control form-control-sm" placeholder="Search Orders...">
                    </div>
                </div>

                <table id="ordersTable" class="table table-striped table-bordered table-sm w-100">
                    <thead>
                        <tr>
                            <th class="table-heading">Order ID</th>
                            <th class="table-heading">Customer</th>
                            <th class="table-heading">Date</th>
                            <th class="table-heading">Total</th>
                            <th class="table-heading">Status</th>
                            <th class="table-heading">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- No static rows, DataTables will fill this -->
                    </tbody>
                </table>
                
                <!-- Mobile Card View -->
                <div id="mobile-orders-view" class="mobile-view-container" style="display: none;">
                    <div class="mb-3">
                        <input type="text" id="mobileSearchInput" class="form-control" placeholder="Search Orders...">
                    </div>
                    <div id="mobile-orders-container">
                        <!-- Orders will be loaded here via JavaScript -->
                    </div>
                    <div id="mobile-loading" class="text-center py-4">
                        <div class="spinner-border text-primary" role="status">
                            <span class="visually-hidden">Loading...</span>
                        </div>
                        <p class="mt-2">Loading orders...</p>
                    </div>
                    <div id="mobile-pagination" class="d-flex justify-content-center mt-3">
                        <!-- Pagination will be added here -->
                    </div>
                </div>
            </div>
        </div>

    </div>
</main>
@endsection

@section('admininsertjavascript')
{{-- <script src="https://code.jquery.com/jquery-3.5.1.js"></script> --}}
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    $('body').addClass('bg-clr');

    $(document).ready(function() {
        var table;
        var isInitialized = false;
        
        function initializeTable() {
            var isMobile = $(window).width() < 768;
            console.log('Initializing table, screen width:', $(window).width(), 'isMobile:', isMobile);
            
            // Destroy existing table if it exists
            if (isInitialized && $.fn.DataTable.isDataTable('#ordersTable')) {
                console.log('Destroying existing table');
                table.destroy();
                // Rebuild table structure
                $('#ordersTable').html(`
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Customer</th>
                            <th>Date</th>
                            <th>Total</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                `);
            }
            
            // Show/hide appropriate views before initialization
            if (isMobile) {
                $('#mobile-orders-view').show();
                $('#mobile-loading').show();
                $('#mobile-orders-container').html('');
                $('#ordersTable').closest('.row').hide();
                $('#ordersTable_wrapper').hide();
            } else {
                $('#mobile-orders-view').hide();
                $('#mobile-loading').hide();
                $('#mobile-orders-container').html('');
                $('#ordersTable').closest('.row').show();
                $('#ordersTable_wrapper').show();
            }
            
            var tableConfig = {
                processing: true,
                serverSide: true,
                ajax: {
                    url: "{{ route('admin.get-orders-list') }}", 
                    type: 'GET',
                    data: function (d) {
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
                    { data: 'order_id', name: 'order_id', orderable: true },
                    { data: 'customer_name', name: 'customer_name', orderable: false },
                    { data: 'created_at', name: 'created_at', orderable: true },
                    { data: 'total_amount', name: 'total_amount', orderable: true },
                    { data: 'status', name: 'status', orderable: false },
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
                    emptyTable: "No orders found",
                    zeroRecords: "No matching orders"
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
                        data.each(function(order) {
                            html += createOrderCard(order);
                        });
                        $('#mobile-orders-container').html(html);
                    } else {
                        $('#mobile-orders-container').html('<div class="text-center py-4"><p>No orders found</p></div>');
                    }
                    
                    updateMobilePagination(api);
                };
                
                tableConfig.initComplete = function(settings, json) {
                    console.log('Mobile table init complete, data:', json);
                    $('#mobile-loading').hide();
                    
                    // Ensure drawCallback fires on init
                    if (json && json.data && json.data.length > 0) {
                        var html = '';
                        json.data.forEach(function(order) {
                            html += createOrderCard(order);
                        });
                        $('#mobile-orders-container').html(html);
                        updateMobilePagination(this.api());
                    } else {
                        $('#mobile-orders-container').html('<div class="text-center py-4"><p>No orders found</p></div>');
                    }
                };
            }
            
            table = $('#ordersTable').DataTable(tableConfig);
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
        
        function createOrderCard(order) {
            // Extract status badge styling
            var statusHtml = '';
            if (order.status) {
                var tempDiv = document.createElement('div');
                tempDiv.innerHTML = order.status;
                var badge = tempDiv.querySelector('.badge');
                if (badge) {
                    statusHtml = `<span class="order-card-status ${badge.className}">${badge.textContent}</span>`;
                } else {
                    statusHtml = `<span class="order-card-status">${order.status}</span>`;
                }
            }
            
            return `
                <div class="order-card">
                    <div class="order-card-header">
                        <div class="order-card-title">Order #${order.order_id || 'N/A'}</div>
                        ${statusHtml}
                    </div>
                    <div class="order-card-body">
                        <div class="order-card-field full-width">
                            <span class="order-card-label">Customer</span>
                            <span class="order-card-value">${order.customer_name || 'N/A'}</span>
                        </div>
                        <div class="order-card-field">
                            <span class="order-card-label">Date</span>
                            <span class="order-card-value">${order.created_at || 'N/A'}</span>
                        </div>
                        <div class="order-card-field">
                            <span class="order-card-label">Total</span>
                            <span class="order-card-value">${order.total_amount || 'N/A'}</span>
                        </div>
                    </div>
                    <div class="order-card-actions">
                        ${order.action}
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
                        $('#mobile-orders-view').show();
                        $('#mobile-loading').show();
                        $('#mobile-orders-container').html('');
                    }
                    
                    // Reinitialize table
                    initializeTable();
                }
                
                lastWidth = currentWidth;
            }, 250);
        });
    });
</script>
@endsection
