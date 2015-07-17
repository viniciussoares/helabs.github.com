console.log('jobs.js');

$('#select-job-form').on('click', 'input[type=radio]', function() {
  formClass = $(this).data('form');
  console.log(formClass);
  $('.form-ruby').hide();
  $('.' + formClass).show();
});