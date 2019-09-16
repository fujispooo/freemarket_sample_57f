window.addEventListener("turbolinks:load", function() {
  // 不適切なワードが登録された際に表示するエラーメッセージ
  function appendUser(user){
    var html = `<p>
                  ※ <span>${user.forbidden_word}</span>は使用できません
                </p>`;
    $('#user-check-result').append(html);
  }
  // 既存のメールアドレスが登録された際に表示するエラーメッセージ
  function appendEmail(){
    var html = `<p>
                  ※ 既に登録されているため使用できません
                </p>`;
    $('#email-check-result').append(html);
  }

  // 不適切なワードが登録された際の処理
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
      // エラーメッセージの表示及び、submit無効化
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

  // 既存のメールアドレスが入力された際の処理
  $(function(){
    $("#user_email").on("blur", function() {
      $('#email-check-result').children().remove();
      var email = $("#user_email").val();
      $('.form__sent-btn').prop('disabled', false);
      $.ajax({
        type: 'GET',
        url: '/jp/signup/emailCheck',
        data: { user:{email: email} },
        dataType: 'json'
      })
      // エラーメッセージの表示及び、submit無効化
      .done(function(user){
        $('#email-check-result').empty();
        if (user != null){
          appendEmail();
          $('.form__sent-btn').prop('disabled', true);
        }
      })
      .fail(function(){
      });
    });
  });
});