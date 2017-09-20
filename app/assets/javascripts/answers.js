$(document).on('turbolinks:load', function() {
  $("input:radio").change(function() {
    $("input:submit").prop("disabled", false);
  });
});
