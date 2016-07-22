$(document).ready(function() {
displayRegisterForm();
showLogin();
});

function showLogin(){
  $('#login-button').on('click', function(event){
  event.preventDefault();
  $.ajax({
    url: '/login',
    method: 'GET'
  })
  .done(function(serverData) {
    $("#nav-bar").append(serverData)
    submitLogin();
  });
})
};

function submitLogin(){
  $("#login-form").on('submit', function(event){
    event.preventDefault();
    var formData = $('#login-form').serialize()
    $.ajax({
      url: '/login',
      method: 'POST',
      data: formData
    })
    .done(function(){
      $('#login-form').remove();
    })
  })

};
function displayRegisterForm(){
  $('#register-button').on('click', function(e){
    e.preventDefault();

    $.ajax({
      url: '/register',
      type: 'get'
    }).done(function(response){
      $('#register-form-container').empty();
      $('#register-form-container').append(response);
      submitRegisterForm()
    })
  })
}
function submitRegisterForm(){
  $('#register-form').submit(function(event){
    event.preventDefault();

    var formData = $('#register-form').serialize();
    $.ajax({
      url: "/register",
      type: "POST",
      data: formData
    }).done(function(response){
      if (response.success === true){
        $('#register-form').hide()
        $('#form-error').empty();
      }else{
        $('#form-error').empty();
        $('#form-error').html('INVALID USERNAME OR PASSWORD');
      }
    })
  })
}
