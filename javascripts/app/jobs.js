InstantClick.on('change', function() {
  $(function() {
    $('#select-job-form').on('click', 'input[type=radio]', function() {
      formClass = $(this).data('form');
      $('.form-ruby').hide();
      $('.' + formClass).show();
    });
  })
});
