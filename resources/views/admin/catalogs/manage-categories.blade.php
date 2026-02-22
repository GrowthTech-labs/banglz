@extends('components.layouts.admin-default')

@section('content')
@include('components.includes.admin.navbar')

<style>
.category-card {
    border: 2px solid #e0e0e0;
    border-radius: 8px;
    padding: 20px;
    margin-bottom: 20px;
    transition: all 0.3s;
}
.category-card:hover {
    border-color: #6cc2b6;
    box-shadow: 0 2px 8px rgba(108, 194, 182, 0.2);
}
.category-card.configured {
    border-color: #6cc2b6;
    background-color: #f8fffe;
}
.category-image-thumb {
    width: 80px;
    height: 80px;
    object-fit: cover;
    margin: 4px;
    border-radius: 6px;
    border: 2px solid transparent;
}
.category-image-thumb.active {
    border-color: #6cc2b6;
}
#drop-area.dragging {
    background: #f8f9fa;
    border-color: #6cc2b6;
}
#image-container {
    display: flex;
    flex-wrap: wrap;
    gap: 8px;
    align-items: flex-start;
}
.existing-image, .new-image-preview {
    position: relative;
}
.remove-btn {
    position: absolute;
    top: 4px;
    right: 4px;
    z-index: 2;
}
</style>

<main class="content-wrapper">
    <div class="container-fluid py-3">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2>Manage Categories for: {{ $collection->name }}</h2>
            <a href="{{ route('admin.catelogs') }}" class="btn text-white" style="background-color: #6cc2b6;">← Back to Catalogs</a>
        </div>

        <div class="alert alert-info">
            <strong>Instructions:</strong> Configure which categories appear in this catalog and customize their title, description, and images. These settings control how category tabs are displayed on the customer-facing catalog page.
        </div>

        <div class="row">
            @foreach($allCategories as $category)
                @php
                    $config = $collection->collectionCategories->firstWhere('category_id', $category->id);
                    $isConfigured = $config !== null;
                @endphp
                <div class="col-md-6 mb-3">
                    <div class="category-card {{ $isConfigured ? 'configured' : '' }}">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h4 class="mb-0">{{ $category->name }}</h4>
                            <div>
                                @if($isConfigured)
                                    <span class="badge bg-success">Configured</span>
                                @else
                                    <span class="badge bg-secondary">Not Configured</span>
                                @endif
                            </div>
                        </div>

                        @if($isConfigured)
                            <div class="mb-2">
                                <strong>Title:</strong> {{ $config->title ?: 'Not set' }}<br>
                                <strong>Description:</strong> {{ Str::limit($config->description, 100) ?: 'Not set' }}<br>
                                <strong>Display Order:</strong> {{ $config->display_order }}<br>
                                <strong>Status:</strong> 
                                @if($config->status)
                                    <span class="badge bg-success">Active</span>
                                @else
                                    <span class="badge bg-danger">Inactive</span>
                                @endif
                            </div>
                            @if(!empty($config->images) && is_array($config->images))
                                <div class="mb-2">
                                    <strong>Images:</strong><br>
                                    @foreach($config->images as $img)
                                        <img src="{{ asset('assets/images/collection_categories/' . $img) }}" class="category-image-thumb">
                                    @endforeach
                                </div>
                            @endif
                        @endif

                        <div class="mt-3">
                            <button type="button" class="btn btn-sm btn-primary" onclick="editCategory({{ $category->id }}, '{{ $category->name }}')">
                                {{ $isConfigured ? 'Edit Configuration' : 'Add to Catalog' }}
                            </button>
                            @if($isConfigured)
                                <button type="button" class="btn btn-sm btn-danger" onclick="deleteCategory({{ $category->id }}, '{{ $category->name }}')">
                                    Remove from Catalog
                                </button>
                            @endif
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</main>

<!-- Edit Modal -->
<div class="modal fade" id="editModal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Configure Category: <span id="modalCategoryName"></span></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <form id="categoryForm" enctype="multipart/form-data">
                @csrf
                <input type="hidden" id="categoryId" name="category_id">
                
                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label">Title</label>
                        <input type="text" name="title" id="title" class="form-control" placeholder="e.g., BANGLES FOR MOM">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Description</label>
                        <textarea name="description" id="description" rows="3" class="form-control" placeholder="Brief description for this category"></textarea>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Display Order</label>
                        <input type="number" name="display_order" id="display_order" class="form-control" value="0" min="0">
                        <small class="text-muted">Lower numbers appear first</small>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Status</label>
                        <select name="status" id="status" class="form-control">
                            <option value="1">Active</option>
                            <option value="0">Inactive</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Images</label>
                        <div id="drop-area" class="border p-4 text-center rounded" style="cursor:pointer;">
                            <p>Drag & drop images here or click to select</p>
                            <small>Max file size: 4MB. Multiple allowed.</small>
                        </div>
                        <input type="file" id="images" name="images[]" accept="image/*" multiple class="d-none">
                        <div id="image-container" class="mt-3"></div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn" style="background-color:#6cc2b6;color:white;">Save Configuration</button>
                </div>
            </form>
        </div>
    </div>
</div>

@endsection

@section('admininsertjavascript')
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
const collectionId = {{ $collection->id }};
let currentCategoryId = null;
let droppedFiles = [];
let removedExisting = [];

function editCategory(categoryId, categoryName) {
    currentCategoryId = categoryId;
    $('#modalCategoryName').text(categoryName);
    $('#categoryId').val(categoryId);
    
    // Reset form
    $('#categoryForm')[0].reset();
    $('#image-container').empty();
    droppedFiles = [];
    removedExisting = [];
    
    // Load existing config
    $.get(`/admin/catelog-get-category-config/${collectionId}/${categoryId}`, function(response) {
        if (response.status && response.data) {
            const data = response.data;
            $('#title').val(data.title || '');
            $('#description').val(data.description || '');
            $('#display_order').val(data.display_order || 0);
            $('#status').val(data.status || 1);
            
            // Load existing images
            if (data.images && Array.isArray(data.images)) {
                data.images.forEach(img => {
                    addExistingImage(img);
                });
            }
        }
        $('#editModal').modal('show');
    });
}

function addExistingImage(filename) {
    const wrapper = $('<div class="existing-image" data-filename="' + filename + '"></div>');
    const img = $('<img src="/assets/images/collection_categories/' + filename + '" class="category-image-thumb">');
    const btn = $('<button type="button" class="btn btn-sm btn-danger remove-existing remove-btn"><i class="fa fa-times"></i></button>');
    
    btn.on('click', function() {
        removedExisting.push(filename);
        wrapper.remove();
    });
    
    const hiddenInput = $('<input type="hidden" name="existing_images[]" value="' + filename + '">');
    
    wrapper.append(img).append(btn).append(hiddenInput);
    $('#image-container').append(wrapper);
}

function deleteCategory(categoryId, categoryName) {
    Swal.fire({
        title: 'Remove Category?',
        text: `Remove "${categoryName}" from this catalog?`,
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#d33',
        cancelButtonColor: '#6c757d',
        confirmButtonText: 'Yes, remove it!',
        reverseButtons: true
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: `/admin/catelog-delete-category-config/${collectionId}/${categoryId}`,
                method: 'DELETE',
                headers: {
                    'X-CSRF-TOKEN': '{{ csrf_token() }}'
                },
                success: function(response) {
                    if (response.status) {
                        Swal.fire('Removed!', response.message, 'success').then(() => {
                            location.reload();
                        });
                    } else {
                        Swal.fire('Error!', response.message, 'error');
                    }
                },
                error: function() {
                    Swal.fire('Error!', 'Something went wrong', 'error');
                }
            });
        }
    });
}

// File upload handling
$(document).ready(function() {
    const dropArea = document.getElementById('drop-area');
    const fileInput = document.getElementById('images');
    const imageContainer = document.getElementById('image-container');

    dropArea.addEventListener('click', () => fileInput.click());

    fileInput.addEventListener('change', e => {
        const files = Array.from(e.target.files || []).filter(f => f.type && f.type.startsWith('image/'));
        files.forEach(f => {
            if (!droppedFiles.some(x => x.name === f.name && x.size === f.size)) {
                droppedFiles.push(f);
                addPreview(f);
            }
        });
        fileInput.value = '';
    });

    ['dragenter','dragover'].forEach(ev => dropArea.addEventListener(ev, e => {
        e.preventDefault();
        dropArea.classList.add('dragging');
    }));
    
    ['dragleave','drop'].forEach(ev => dropArea.addEventListener(ev, e => {
        e.preventDefault();
        dropArea.classList.remove('dragging');
    }));
    
    dropArea.addEventListener('drop', e => {
        const files = Array.from(e.dataTransfer.files || []).filter(f => f.type && f.type.startsWith('image/'));
        files.forEach(f => {
            if (!droppedFiles.some(x => x.name === f.name && x.size === f.size)) {
                droppedFiles.push(f);
                addPreview(f);
            }
        });
    });

    function addPreview(file) {
        const reader = new FileReader();
        reader.onload = ev => {
            const wrapper = $('<div class="new-image-preview"></div>');
            const img = $('<img src="' + ev.target.result + '" class="category-image-thumb">');
            const btn = $('<button type="button" class="btn btn-sm btn-danger remove-new-image remove-btn"><i class="fa fa-times"></i></button>');
            
            btn.on('click', function() {
                const idx = droppedFiles.indexOf(file);
                if (idx !== -1) droppedFiles.splice(idx, 1);
                wrapper.remove();
            });
            
            wrapper.append(img).append(btn);
            $('#image-container').append(wrapper);
        };
        reader.readAsDataURL(file);
    }

    // Form submission
    $('#categoryForm').on('submit', function(e) {
        e.preventDefault();
        
        const formData = new FormData(this);
        droppedFiles.forEach(f => formData.append('images[]', f));
        formData.append('removed_existing_images', JSON.stringify(removedExisting));
        
        Swal.fire({
            title: 'Saving...',
            allowOutsideClick: false,
            didOpen: () => Swal.showLoading()
        });
        
        $.ajax({
            url: `/admin/catelog-save-category-config/${collectionId}`,
            method: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function(response) {
                Swal.close();
                if (response.status) {
                    Swal.fire('Success', response.message, 'success').then(() => {
                        location.reload();
                    });
                } else {
                    Swal.fire('Error', response.message, 'error');
                }
            },
            error: function(xhr) {
                Swal.close();
                let msg = 'Something went wrong';
                if (xhr.status === 422 && xhr.responseJSON && xhr.responseJSON.message) {
                    msg = xhr.responseJSON.message;
                }
                Swal.fire('Error', msg, 'error');
            }
        });
    });
});
</script>
@endsection
