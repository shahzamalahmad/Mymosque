// app/assets/javascripts/active_admin_custom.js
$(document).on('turbolinks:load', function() {
  $('.first-name-input, .last-name-input').on('input', function() {
    var firstName = $('.first-name-input').val();
    var lastName = $('.last-name-input').val();
    var fullName = firstName + ' ' + lastName;
    $('.full-name-input').val(fullName);
  });
});

// custom.js

document.addEventListener('DOMContentLoaded', function() {
  $('.map-input').geocomplete();
});
