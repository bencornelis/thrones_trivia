$(document).on('turbolinks:load', function() {
  $('input:radio').change(function() {
    $('input:submit').prop('disabled', false);
  });

  $('.clickable').click(function() {
    $(this).find('input:radio').prop('checked', true).change();
  });
});

