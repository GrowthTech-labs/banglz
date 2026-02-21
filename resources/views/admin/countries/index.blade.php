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
                        <tr>
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
    </div>
</main>
@endsection

@section('admininsertjavascript')
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    $('.sidenav li').removeClass('active');
    $('.sidenav li:has(a[href="{{ route('admin.countries.index') }}"])').addClass('active');

    // Search functionality
    $('#searchInput').on('keyup', function() {
        var value = $(this).val().toLowerCase();
        $('#countries-table tbody tr').filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
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
