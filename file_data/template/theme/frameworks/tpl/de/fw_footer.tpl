<footer class="site-footer text-white py-5 mt-5" role="contentinfo">
  <div class="container">
    <div class="row g-4 align-items-center">
      <div class="col-lg-6">
        <h2 class="h4 mb-3"><% if ($gbl_config.adr_general_firmname) %><% $gbl_config.adr_general_firmname %><% else %>Keimeno CMS Demo<% /if %></h2>
        <p class="mb-0 text-white-50">
          Modernized CMS theme with local assets, glassmorphism styling and reusable frontend modules.
        </p>
      </div>
      <div class="col-lg-6 d-flex flex-column flex-md-row justify-content-lg-end gap-3 text-lg-end">
        <a class="text-white" href="#services">Services</a>
        <a class="text-white" href="#gallery">Gallery</a>
        <a class="text-white" href="#resources">Resources</a>
        <span class="text-white-50">&copy; <%$smarty.now|date_format:"%Y"%> <% if ($gbl_config.adr_general_firmname) %><% $gbl_config.adr_general_firmname %><% else %>Keimeno CMS<% /if %></span>
      </div>
    </div>
  </div>
</footer>
<script src="<% $PATH_CMS %>file_data/template/assets/vendor/jquery/jquery.min.js" title="jQuery"></script>
<script src="<% $PATH_CMS %>file_data/template/assets/vendor/bootstrap/js/bootstrap.bundle.min.js" title="Bootstrap Bundle"></script>
<script src="<% $PATH_CMS %>file_data/template/assets/vendor/gsap/gsap.min.js" title="GSAP"></script>
<script src="<% $PATH_CMS %>file_data/template/assets/vendor/slick/slick.min.js" title="Slick Slider"></script>
<script src="<% $PATH_CMS %>file_data/template/assets/vendor/fancybox/fancybox.umd.js" title="Fancybox"></script>
<script src="<% $PATH_CMS %>file_data/template/js/main.js" title="Main Script"></script>
</body>
</html>
