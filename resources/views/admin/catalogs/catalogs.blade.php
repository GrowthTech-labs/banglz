@extends('components.layouts.admin-default')
<link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap4.min.css">
@section('content')
@include('components.includes.admin.navbar')
<main class="content-wrapper">

    <div class="container-fluid py-3">
        <div class="heading-top d-flex justify-content-between align-items-center">
            <h1 class="mb-0">All Catelogs</h1>
            <a href="{{ route('admin.catelog.create') }}" class="btn text-white " style="background-color: #6cc2b6; border-color: #6cc2b6;">+ Add New Catelogs</a>
        </div>
    </div>
    
    <!-- Desktop Table View -->
    <div class="client-table pt-2">
        <div class="row g-2 align-items-center mb-3">
            <div class="col-1">
                <label for="searchInput" class="col-form-label">Search:</label>
            </div>
            <div class="col-11">
                <input type="text" id="searchInput" class="form-control form-control-sm" placeholder="Search Catelogs...">
            </div>
        </div>
        <table id="catelog-table" style="width: 100%">
            <thead>
                <tr>
                    <th class="table-heading">Name</th>
                    <th class="table-heading">status</th>
                    <th class="table-heading">description</th>
                    <th class="table-heading">Action</th>
                </tr>
            </thead>
            <tbody>
                <tr></tr>
            </tbody>
        </table>
    </div>
    
    <!-- Mobile Card View -->
    <div id="mobile-catalogs-view" class="mobile-view-container">
        <div class="mb-3">
            <input type="text" id="mobileSearchInput" class="form-control" placeholder="Search Catelogs...">
        </div>
        <div id="mobile-catalogs-container">
            <!-- Catalogs will be loaded here via JavaScript -->
        </div>
        <div id="mobile-loading" class="text-center py-4">
            <div class="spinner-border text-primary" role="status">
                <span class="visually-hidden">Loading...</span>
            </div>
            <p class="mt-2">Loading catalogs...</p>
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
            if (isInitialized && $.fn.DataTable.isDataTable('#catelog-table')) {
                console.log('Destroying existing table');
                table.destroy();
                // Rebuild table structure
                $('#catelog-table').html(`
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>status</th>
                            <th>description</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                `);
            }
            
            // Show/hide appropriate views before initialization
            if (isMobile) {
                $('#mobile-catalogs-view').show();
                $('#mobile-loading').show();
                $('#mobile-catalogs-container').html('');
                $('.client-table').hide();
            } else {
                $('#mobile-catalogs-view').hide();
                $('#mobile-loading').hide();
                $('#mobile-catalogs-container').html('');
                $('.client-table').show();
            }
            
            var tableConfig = {
                processing: true,
                serverSide: true,
                ajax: {
                    url: "{{ route('admin.get-catelogs-list') }}",
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
                    { data: 'name', name: 'name', orderable: true },
                    { data: 'status', name: 'status', orderable: false },
                    { data: 'description', name: 'description', orderable: false },
                    { data: 'action', name: 'action', orderable: false }
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
                    emptyTable: "No Catelog found",
                    zeroRecords: "No Catelog found"
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
                        data.each(function(catalog) {
                            html += createCatalogCard(catalog);
                        });
                        $('#mobile-catalogs-container').html(html);
                    } else {
                        $('#mobile-catalogs-container').html('<div class="text-center py-4"><p>No catalogs found</p></div>');
                    }
                    
                    updateMobilePagination(api);
                };
                
                tableConfig.initComplete = function(settings, json) {
                    console.log('Mobile table init complete, data:', json);
                    $('#mobile-loading').hide();
                    
                    // Ensure drawCallback fires on init
                    if (json && json.data && json.data.length > 0) {
                        var html = '';
                        json.data.forEach(function(catalog) {
                            html += createCatalogCard(catalog);
                        });
                        $('#mobile-catalogs-container').html(html);
                        updateMobilePagination(this.api());
                    } else {
                        $('#mobile-catalogs-container').html('<div class="text-center py-4"><p>No catalogs found</p></div>');
                    }
                };
            }
            
            table = $('#catelog-table').DataTable(tableConfig);
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
        
        function createCatalogCard(catalog) {
            // Parse status badge
            var statusBadge = '';
            if (catalog.status && catalog.status.includes('Active')) {
                statusBadge = '<span class="badge-category badge-active">Active</span>';
            } else if (catalog.status && catalog.status.includes('Inactive')) {
                statusBadge = '<span class="badge-category badge-inactive">Inactive</span>';
            } else {
                statusBadge = catalog.status;
            }
            
            // Truncate description if too long
            var description = catalog.description || 'N/A';
            if (description.length > 150) {
                description = description.substring(0, 150) + '...';
            }
            
            return `
                <div class="catalog-card">
                    <div class="catalog-card-header">
                        <div class="catalog-card-title">${catalog.name}</div>
                    </div>
                    <div class="catalog-card-body">
                        <div class="catalog-card-field">
                            <span class="catalog-card-label">Status</span>
                            <span class="catalog-card-value">${statusBadge}</span>
                        </div>
                        <div class="catalog-card-field">
                            <span class="catalog-card-label">Description</span>
                            <span class="catalog-card-value">${description}</span>
                        </div>
                    </div>
                    <div class="catalog-card-actions">
                        ${catalog.action}
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
                        $('#mobile-catalogs-view').show();
                        $('#mobile-loading').show();
                        $('#mobile-catalogs-container').html('');
                    }
                    
                    // Reinitialize table
                    initializeTable();
                }
                
                lastWidth = currentWidth;
            }, 250);
        });
    });

    function confirmDelete(id) {
        Swal.fire({
            title: 'Are you sure?',
            text: "This Catelog will be deleted!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#6c757d',
            confirmButtonText: 'Yes, delete it!',
            reverseButtons: true
        }).then((result) => {
            if (result.isConfirmed) {
                // Use route URL
                const url = "{{ route('admin.catelog.delete', ':id') }}".replace(':id', id);

                // Optional: Use AJAX for deletion
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
                            Swal.fire(
                                'Deleted!',
                                'Catelog has been deleted.',
                                'success'
                            ).then(() => {
                                location.reload(); // Refresh page
                            });
                        } else {
                            Swal.fire(
                                'Error!',
                                'Something went wrong.',
                                'error'
                            );
                        }
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

<script>
    $('.sidenav  li:nth-of-type(5)').addClass('active');
</script>
@endsection