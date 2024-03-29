// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require rails-ujs
//= require turbolinks
//= require materialize
//= require Chart.bundle
//= require chartkick
//= require sugar.min
//= require_tree .

document.addEventListener('turbolinks:load', function() {
   M.AutoInit();
 elem = document.querySelector('#slide-out');
 instance = new M.Sidenav(elem, {});
 $(".dropdown-trigger").dropdown({  });

});
document.addEventListener('turbolinks:before-cache', () => {
 M.AutoInit();
 const elem = document.querySelector('#slide-out');
 const instance = M.Sidenav.getInstance(elem);
 if (instance) {
   instance.destroy();
 }
});
