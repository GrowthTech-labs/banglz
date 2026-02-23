@extends('components.layouts.admin-default')
<link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap4.min.css">
@section('content')
@include('components.includes.admin.navbar')
<main class="content-wrapper">

    <div class="container-fluid py-3">
        <div class="heading-top d-flex justify-content-between align-items-center">
            <h1 class="mb-0">All Box Size</h1>
            <a href="{{ route('admin.box-size.create') }}" class="btn text-white " style="background-color: #6cc2b6; border-color: #6cc2b6;">+ Add Box Size</a>
        </div>
    </div>
    
    <!-- Desktop Table View -->
    <div class="client-table pt-2">
        <div class="row g-2 align-items-center mb-3">
            <div class="col-1">
                <label for="searchInput" class="col-form-label">Search:</label>
            </div>
            <div class="col-11">
                <input type="text" id="searchInput" class="form-control form-control-sm" placeholder="Search Box Size...">
            </div>
        </div>
        <table id="box-size-table" style="width: 100%">
            <thead>
                <tr>
                    <th class="table-heading">Size</th>
                    <th class="table-heading">Price</th>
                    <th class="table-heading">Action</th>
                </tr>
            </thead>
            <tbody>
                <tr></tr>
            </tbody>
        </table>
    </div>
    
    <!-- Mobile Card View -->
    <div id="mobile-box-sizes-view" class="mobile-view-container">
        <div class="mb-3">
            <input type="text" id="mobileSearchInput" class="form-control" placeholder="Search Box Size...">
        </div>
        <div id="mobile-box-sizes-container">
            <!-- Box sizes will be loaded here via JavaScript -->
        </div>
        <div id="mobile-loading" class="text-center py-4">
            <div class="spinner-border text-primary" role="status">
                <span class="visually-hidden">Loading...</span>
            </div>
            <p class="mt-2">Loading box sizes...</p>
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
            if (isInitialized && $.fn.DataTable.isDataTable('#box-size-table')) {
                console.log('Destroying existing table');
                table.destroy();
                // Rebuild table structure
                $('#box-size-table').html(`
                    <thead>
                        <tr>
                            <th>Size</th>
                            <th>Price</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                `);
            }
            
            // Show/hide appropriate views before initialization
            if (isMobile) {
                $('#mobile-box-sizes-view').show();
                $('#mobile-loading').show();
                $('#mobile-box-sizes-container').html('');
                $('.client-table').hide();
            } else {
                $('#mobile-box-sizes-view').hide();
                $('#mobile-loading').hide();
                $('#mobile-box-sizes-container').html('');
                $('.client-table').show();
            }
            
            var tableConfig = {
                processing: true,
                serverSide: true,
                ajax: {
                    url: "{{ route('admin.get-box-size-list') }}",
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
                    { data: 'size', name: 'size', orderable: true },
                    { data: 'price', name: 'price', orderable: true },
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
                    emptyTable: "No Box Size found",
                    zeroRecords: "No Box Size found"
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
                        data.each(function(boxSize) {
                            html += createBoxSizeCard(boxSize);
                        });
                        $('#mobile-box-sizes-container').html(html);
                    } else {
                        $('#mobile-box-sizes-container').html('<div class="text-center py-4"><p>No box sizes found</p></div>');
                    }
                    
                    updateMobilePagination(api);
                };
                
                tableConfig.initComplete = function(settings, json) {
                    console.log('Mobile table init complete, data:', json);
                    $('#mobile-loading').hide();
                    
                    // Ensure drawCallback fires on init
                    if (json && json.data && json.data.length > 0) {
                        var html = '';
                        json.data.forEach(function(boxSize) {
                            html += createBoxSizeCard(boxSize);
                        });
                        $('#mobile-box-sizes-container').html(html);
                        updateMobilePagination(this.api());
                    } else {
                        $('#mobile-box-sizes-container').html('<div class="text-center py-4"><p>No box sizes found</p></div>');
                    }
                };
            }
            
            table = $('#box-size-table').DataTable(tableConfig);
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
        
        function createBoxSizeCard(boxSize) {
            return `
                <div class="box-size-card">
                    <div class="box-size-card-header">
                        <div class="box-size-card-title">Size: ${boxSize.size}</div>
                    </div>
                    <div class="box-size-card-body">
                        <div class="box-size-card-field">
                            <span class="box-size-card-label">Price</span>
                            <span class="box-size-card-value">${boxSize.price || 'N/A'}</span>
                        </div>
                    </div>
                    <div class="box-size-card-actions">
                        ${boxSize.action}
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
                        $('#mobile-box-sizes-view').show();
                        $('#mobile-loading').show();
                        $('#mobile-box-sizes-container').html('');
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
            text: "This Box size will be deleted!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#6c757d',
            confirmButtonText: 'Yes, delete it!',
            reverseButtons: true
        }).then((result) => {
            if (result.isConfirmed) {
                // Use route URL
                const url = "{{ route('admin.box-size.delete', ':id') }}".replace(':id', id);

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
                                'Box Size has been deleted.',
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
    $('.sidenav  li:nth-of-type(12)').addClass('active');
</script>
@endsection