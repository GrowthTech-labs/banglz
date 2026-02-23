  <!-- ============= Bootstrap Scripts =========== -->
  {{-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script> --}}
  {{-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script> --}}
  <!-- ============= Bootstrap Scripts =========== -->
  <script src="{{ asset('assets/js/jquery.js') }}"></script>
  <script src="{{ asset('assets/js/bootstrap.min.js') }}"></script>
  <script src="{{ asset('assets/js/bootstrap.js') }}"></script>
  <script src="{{ asset('assets/js/bootstrap.bundle.min.js') }}"></script>


  {{-- <script src="https://code.jquery.com/jquery-3.3.1.min.js"
          integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous">
          </script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> --}}

  <script>
      // Enhanced mobile sidebar functionality
      $(document).ready(function() {
          // Add/remove body class for backdrop
          $('.navbar-collapse').on('show.bs.collapse', function() {
              if ($(window).width() < 992) {
                  $('body').addClass('sidebar-open');
                  $('body').css('overflow', 'hidden');
              }
          });
          
          $('.navbar-collapse').on('hide.bs.collapse', function() {
              $('body').removeClass('sidebar-open');
              $('body').css('overflow', 'auto');
          });
          
          // Close sidebar when clicking on backdrop (outside sidebar)
          $(document).on('click', function(e) {
              if ($(window).width() < 992) {
                  var $navbar = $('.navbar-collapse');
                  var $toggler = $('.navbar-toggler');
                  var $navbarHeader = $('.navbar-header');
                  
                  // Check if sidebar is open
                  if ($navbar.hasClass('show')) {
                      // Check if click is outside sidebar, toggler, and navbar header
                      if (!$navbar.is(e.target) && 
                          $navbar.has(e.target).length === 0 &&
                          !$toggler.is(e.target) &&
                          $toggler.has(e.target).length === 0 &&
                          !$navbarHeader.is(e.target) &&
                          $navbarHeader.has(e.target).length === 0) {
                          $navbar.collapse('hide');
                      }
                  }
              }
          });
          
          // Close sidebar when clicking on a nav link (except dropdown toggles)
          $('.sidenav .nav-link').on('click', function(e) {
              if ($(window).width() < 992) {
                  // Don't close if it's a dropdown toggle
                  if (!$(this).hasClass('toggle-menu') && 
                      !$(this).attr('data-bs-toggle') &&
                      !$(this).attr('data-toggle')) {
                      // Small delay to allow navigation to start
                      setTimeout(function() {
                          $('.navbar-collapse').collapse('hide');
                      }, 100);
                  }
              }
          });
          
          // Ensure nav links are clickable
          $('.sidenav .nav-link').css('pointer-events', 'auto');
      });
  </script>

