function appendUser(user){
  var html = `<p>
                ※ <span>${user.forbidden_word}</span>は使用できません
              </p>`;
  $('#user-check-result').append(html);
}

$(function(){
  $("#user_name").on("blur", function() {
    $('#user-check-result').children().remove();
    var nickname = $("#user_name").val();
    $('.form__sent-btn').prop('disabled', false);
    $.ajax({
      type: 'GET',
      url: '/jp/signup/check',
      data: { user:{nickname: nickname} },
      dataType: 'json'
    })
    .done(function(user){
      $('#user-check-result').empty();
      if (user.length !==0){
        appendUser(user);
        $('.form__sent-btn').prop('disabled', true);
      }
    })
    .fail(function(){
    });
  });
});