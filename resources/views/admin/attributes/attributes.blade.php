@extends('components.layouts.admin-default')
<link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap4.min.css">
@section('content')
@include('components.includes.admin.navbar')
<main class="content-wrapper">

    <div class="container-fluid py-3">
         <div class="heading-top d-flex justify-content-between align-items-center">
        <h1 class="mb-0">All Attribute</h1>
        <a href="{{ route('admin.attributes.create') }}" class="btn text-white " style="background-color: #6cc2b6; border-color: #6cc2b6;">+ Add New Attributes</a>
    </div>
        </div>
        
        <!-- Desktop Table View -->
        <div class="client-table pt-2">
            <div class="row g-2 align-items-center mb-3">
                <div class="col-1">
                    <label for="searchInput" class="col-form-label">Search:</label>
                </div>
                <div class="col-11">
                    <input type="text" id="searchInput" class="form-control form-control-sm" placeholder="Search Attributes...">
                </div>
            </div>
            <table id="detail-table" style="width: 100%">
                <thead>
                    <tr>
                        <th class="table-heading">Name</th>
                        <th class="table-heading">Type</th>
                        <th class="table-heading">status</th>
                        <th class="table-heading">Top Listed</th>
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
        <div id="mobile-attributes-view" class="mobile-view-container">
            <div class="mb-3">
                <input type="text" id="mobileSearchInput" class="form-control" placeholder="Search Attributes...">
            </div>
            <div id="mobile-attributes-container">
                <!-- Attributes will be loaded here via JavaScript -->
            </div>
            <div id="mobile-loading" class="text-center py-4">
                <div class="spinner-border text-primary" role="status">
                    <span class="visually-hidden">Loading...</span>
                </div>
                <p class="mt-2">Loading attributes...</p>
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
            if (isInitialized && $.fn.DataTable.isDataTable('#detail-table')) {
                console.log('Destroying existing table');
                table.destroy();
                // Rebuild table structure
                $('#detail-table').html(`
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Type</th>
                            <th>status</th>
                            <th>Top Listed</th>
                            <th>description</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                `);
            }
            
            // Show/hide appropriate views before initialization
            if (isMobile) {
                $('#mobile-attributes-view').show();
                $('#mobile-loading').show();
                $('#mobile-attributes-container').html('');
                $('.client-table').hide();
            } else {
                $('#mobile-attributes-view').hide();
                $('#mobile-loading').hide();
                $('#mobile-attributes-container').html('');
                $('.client-table').show();
            }
            
            var tableConfig = {
                processing: true,
                serverSide: true,
                ajax: {
                    url: "{{ route('admin.get-attributes-list') }}",
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
                    { data: 'type', name: 'type', orderable: true },
                    { data: 'status', name: 'status', orderable: false },
                    { data: 'top_list', name: 'top_list', orderable: true },
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
                    emptyTable: "No Attribute found",
                    zeroRecords: "No Attribute found"
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
                        data.each(function(attribute) {
                            html += createAttributeCard(attribute);
                        });
                        $('#mobile-attributes-container').html(html);
                    } else {
                        $('#mobile-attributes-container').html('<div class="text-center py-4"><p>No attributes found</p></div>');
                    }
                    
                    updateMobilePagination(api);
                };
                
                tableConfig.initComplete = function(settings, json) {
                    console.log('Mobile table init complete, data:', json);
                    $('#mobile-loading').hide();
                    
                    // Ensure drawCallback fires on init
                    if (json && json.data && json.data.length > 0) {
                        var html = '';
                        json.data.forEach(function(attribute) {
                            html += createAttributeCard(attribute);
                        });
                        $('#mobile-attributes-container').html(html);
                        updateMobilePagination(this.api());
                    } else {
                        $('#mobile-attributes-container').html('<div class="text-center py-4"><p>No attributes found</p></div>');
                    }
                };
            }
            
            table = $('#detail-table').DataTable(tableConfig);
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
        
        function createAttributeCard(attribute) {
            // Parse status badge
            var statusBadge = '';
            if (attribute.status && attribute.status.includes('Active')) {
                statusBadge = '<span class="badge-category badge-active">Active</span>';
            } else if (attribute.status && attribute.status.includes('Inactive')) {
                statusBadge = '<span class="badge-category badge-inactive">Inactive</span>';
            } else {
                statusBadge = attribute.status;
            }
            
            // Parse top listed badge
            var topListBadge = '';
            if (attribute.top_list && attribute.top_list.includes('Yes')) {
                topListBadge = '<span class="badge-category badge-yes">Yes</span>';
            } else if (attribute.top_list && attribute.top_list.includes('No')) {
                topListBadge = '<span class="badge-category badge-no">No</span>';
            } else {
                topListBadge = attribute.top_list;
            }
            
            // Truncate description if too long
            var description = attribute.description || 'N/A';
            if (description.length > 100) {
                description = description.substring(0, 100) + '...';
            }
            
            return `
                <div class="attribute-card">
                    <div class="attribute-card-header">
                        <div class="attribute-card-title">${attribute.name}</div>
                    </div>
                    <div class="attribute-card-body">
                        <div class="attribute-card-field">
                            <span class="attribute-card-label">Type</span>
                            <span class="attribute-card-value">${attribute.type || 'N/A'}</span>
                        </div>
                        <div class="attribute-card-field">
                            <span class="attribute-card-label">Status</span>
                            <span class="attribute-card-value">${statusBadge}</span>
                        </div>
                        <div class="attribute-card-field">
                            <span class="attribute-card-label">Top Listed</span>
                            <span class="attribute-card-value">${topListBadge}</span>
                        </div>
                        <div class="attribute-card-field full-width">
                            <span class="attribute-card-label">Description</span>
                            <span class="attribute-card-value">${description}</span>
                        </div>
                    </div>
                    <div class="attribute-card-actions">
                        ${attribute.action}
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
                        $('#mobile-attributes-view').show();
                        $('#mobile-loading').show();
                        $('#mobile-attributes-container').html('');
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
            text: "This Attribute will be deleted!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#6c757d',
            confirmButtonText: 'Yes, delete it!',
            reverseButtons: true
        }).then((result) => {
            if (result.isConfirmed) {
                // Use route URL
                const url = "{{ route('attribute.delete', ':id') }}".replace(':id', id);

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
                                'Attribute has been deleted.',
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
    $('.sidenav  li:nth-of-type(4)').addClass('active');
</script>
@endsection