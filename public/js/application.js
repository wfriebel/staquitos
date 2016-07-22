$(document).ready(function() {
  console.log("READY!");
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them
showLogin();
submitLogin();
  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});

function showLogin(){
  $('#login-button').on('click', function(event){
  event.preventDefault();
  // console.log(event);
  $.ajax({
    url: '/login',
    method: 'GET'
  })
  .done(function(serverData) {
    $("#nav-bar").append(serverData)
  });
})
};

function submitLogin(){
  $("#nav-bar").on('submit', function(event){
    event.preventDefault();
    console.log(event);
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
