// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require twitter/bootstrap
//= require jquery.facebox
//= require_tree .

jQuery(document).ready(function($) {
  $('a[rel*=facebox]').facebox()
})

(function() {
  var page = 1,
  loading = false;

  function nearBottomOfPage() {
    return $(window).scrollTop() > $(document).height() - $(window).height() - 200;
  }

  $(window).scroll(function(){
    if (loading) {
      return;
    }

    if(nearBottomOfPage()) {
      loading=true;
      page++;
      $(".products").append("<img class='spinner' src='/assets/loading.gif'/>")
      $.ajax({
        url: '/products?page=' + page,
        type: 'get',
        dataType: 'script',
        success: function() {
          $('.spinner').remove()
          $(window).sausage('draw');
          $('a[rel*=facebox]').facebox()
          loading=false;
        }
      });
    }
  });

  $(window).sausage();
}());