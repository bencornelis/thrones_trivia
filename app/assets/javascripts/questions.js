$(document).on('turbolinks:load', function() {
  $('input:radio').change(function() {
    $('input:submit').prop('disabled', false);
  });

  $('.answer').click(function() {
    $(this).find('input:radio').prop('checked', true).change();
  });
});

