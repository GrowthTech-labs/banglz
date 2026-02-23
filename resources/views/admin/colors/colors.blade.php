@extends('components.layouts.admin-default')
<link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap4.min.css">
@section('content')
@include('components.includes.admin.navbar')
<main class="content-wrapper">

    <div class="container-fluid py-3">
        <div class="heading-top d-flex justify-content-between align-items-center">
            <h1 class="mb-0">All Colors</h1>
            <a href="{{ route('admin.color.create') }}" class="btn text-white " style="background-color: #6cc2b6; border-color: #6cc2b6;">+ Add New Colors</a>
        </div>
    </div>
    
    <!-- Desktop Table View -->
    <div class="client-table pt-2">
        <div class="row g-2 align-items-center mb-3">
            <div class="col-1">
                <label for="searchInput" class="col-form-label">Search:</label>
            </div>
            <div class="col-11">
                <input type="text" id="searchInput" class="form-control form-control-sm" placeholder="Search Colors...">
            </div>
        </div>
        <table id="color-table" style="width: 100%">
            <thead>
                <tr>
                    <th class="table-heading">Name</th>
                    <th class="table-heading">Hex Code</th>
                    <th class="table-heading">Color</th>
                    <th class="table-heading">Action</th>
                </tr>
            </thead>
            <tbody>
                <tr></tr>
            </tbody>
        </table>
    </div>
    
    <!-- Mobile Card View -->
    <div id="mobile-colors-view" class="mobile-view-container">
        <div class="mb-3">
            <input type="text" id="mobileSearchInput" class="form-control" placeholder="Search Colors...">
        </div>
        <div id="mobile-colors-container">
            <!-- Colors will be loaded here via JavaScript -->
        </div>
        <div id="mobile-loading" class="text-center py-4">
            <div class="spinner-border text-primary" role="status">
                <span class="visually-hidden">Loading...</span>
            </div>
            <p class="mt-2">Loading colors...</p>
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
            if (isInitialized && $.fn.DataTable.isDataTable('#color-table')) {
                console.log('Destroying existing table');
                table.destroy();
                // Rebuild table structure
                $('#color-table').html(`
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Hex Code</th>
                            <th>Color</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                `);
            }
            
            // Show/hide appropriate views before initialization
            if (isMobile) {
                $('#mobile-colors-view').show();
                $('#mobile-loading').show();
                $('#mobile-colors-container').html('');
                $('.client-table').hide();
            } else {
                $('#mobile-colors-view').hide();
                $('#mobile-loading').hide();
                $('#mobile-colors-container').html('');
                $('.client-table').show();
            }
            
            var tableConfig = {
                processing: true,
                serverSide: true,
                ajax: {
                    url: "{{ route('admin.get-colors-list') }}",
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
                    { data: 'hex_code', name: 'hex_code', orderable: false },
                    { data: 'color', name: 'color', orderable: false },
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
                    emptyTable: "No Color found",
                    zeroRecords: "No Color found"
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
                        data.each(function(color) {
                            html += createColorCard(color);
                        });
                        $('#mobile-colors-container').html(html);
                    } else {
                        $('#mobile-colors-container').html('<div class="text-center py-4"><p>No colors found</p></div>');
                    }
                    
                    updateMobilePagination(api);
                };
                
                tableConfig.initComplete = function(settings, json) {
                    console.log('Mobile table init complete, data:', json);
                    $('#mobile-loading').hide();
                    
                    // Ensure drawCallback fires on init
                    if (json && json.data && json.data.length > 0) {
                        var html = '';
                        json.data.forEach(function(color) {
                            html += createColorCard(color);
                        });
                        $('#mobile-colors-container').html(html);
                        updateMobilePagination(this.api());
                    } else {
                        $('#mobile-colors-container').html('<div class="text-center py-4"><p>No colors found</p></div>');
                    }
                };
            }
            
            table = $('#color-table').DataTable(tableConfig);
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
        
        function createColorCard(color) {
            // Extract hex code from the color.color HTML if it contains a div with style
            var hexCode = color.hex_code || '#000000';
            
            // Parse the color swatch from the HTML
            var colorSwatch = '';
            if (color.color) {
                // If color.color contains HTML with inline style, extract it
                var tempDiv = document.createElement('div');
                tempDiv.innerHTML = color.color;
                var colorDiv = tempDiv.querySelector('div[style]');
                if (colorDiv) {
                    var style = colorDiv.getAttribute('style');
                    colorSwatch = `<div class="color-card-swatch-box" style="${style}"></div>`;
                } else {
                    colorSwatch = `<div class="color-card-swatch-box" style="background-color: ${hexCode};"></div>`;
                }
            } else {
                colorSwatch = `<div class="color-card-swatch-box" style="background-color: ${hexCode};"></div>`;
            }
            
            return `
                <div class="color-card">
                    <div class="color-card-header">
                        <div class="color-card-title">${color.name}</div>
                    </div>
                    <div class="color-card-body">
                        <div class="color-card-field">
                            <span class="color-card-label">Hex Code</span>
                            <span class="color-card-value">${hexCode}</span>
                        </div>
                        <div class="color-card-field">
                            <span class="color-card-label">Color Preview</span>
                            <div class="color-card-swatch">
                                ${colorSwatch}
                            </div>
                        </div>
                    </div>
                    <div class="color-card-actions">
                        ${color.action}
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
                        $('#mobile-colors-view').show();
                        $('#mobile-loading').show();
                        $('#mobile-colors-container').html('');
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
            text: "This Color will be deleted!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#6c757d',
            confirmButtonText: 'Yes, delete it!',
            reverseButtons: true
        }).then((result) => {
            if (result.isConfirmed) {
                // Use route URL
                const url = "{{ route('admin.color.delete', ':id') }}".replace(':id', id);

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
                                'Color has been deleted.',
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
    $('.sidenav  li:nth-of-type(6)').addClass('active');
</script>
@endsection