window.addEventListener("turbolinks:load", function() {
  // 全角カタカナのみ
  jQuery.validator.addMethod("katakana", function(value, element) {
    return this.optional(element) || /^([ァ-ヶー]+)$/.test(value);
    }, "<br/>全角カタカナを入力してください"
  );
  $(function(){
    $("#user_signup-form").validate({
      rules : {
        "user[nickname]":{
          required: true,
          minlength: 2,
          maxlength: 10
        },
        "user[email]":{
          required: true,
          email: true
        },
        "user[password]":{
          required: true,
          password: true,
          minlength: 7
        },
        "user[password_confirmation]":{
          required: true,
          password: true,
          minlength: 7,
          equalTo: "#user_password"
        },
        "user[first_name]":{
          required: true
        },
        "user[last_name]":{
          required: true
        },
        "user[first_name_kana]":{
          required: true,
          katakana: true
        },
        "user[last_name_kana]":{
          required: true,
          katakana: true
        },
        "user[birth_year]":{
          required: true
        },
        "user[birth_month]":{
          required: true
        },
        "user[birth_day]":{
          required: true
        }
      },
      messages : {
        "user[nickname]":{
          required: "ニックネーム は必須項目です",
          minlength: "2文字以上で入力してください",
          maxlength: "10文字以内で入力してください"
        },
        "user[email]":{
          required: "メールアドレス は必須項目です",
        },
        "user[password]":{
          required: "パスワード は必須項目です",
        },
        "user[password_confirmation]":{
          required: "パスワード再認証 は必須項目です",
        },
        "user[first_name]":{
          required: "姓 は必須項目です"
        },
        "user[last_name]":{
          required: "名 は必須項目です"
        },
        "user[first_name_kana]":{
          required: "姓(カナ) は必須項目です"
        },
        "user[last_name_kana]":{
          required: "名(カナ) は必須項目です"
        },
        "user[birth_year]":{
          required: "\"年\" は必須項目です"
        },
        "user[birth_month]":{
          required: "\"月\" は必須項目です"
        },
        "user[birth_day]":{
          required: "\"日\" は必須項目です"
        }
      },
      errorPlacement: function(error, element) {
        if (element.attr('name') == 'user[nickname]') {
          error.appendTo($('#emsg_nickname'));
        }
        if (element.attr('name') == 'user[email]') {
          error.appendTo($('#emsg_email'));
        }
        if (element.attr('name') == 'user[password]') {
          error.appendTo($('#emsg_password'));
        }
        if (element.attr('name') == 'user[password_confirmation]') {
          error.appendTo($('#emsg_password_confirmation'));
        }
        if (element.attr('name') == 'user[first_name]') {
          error.appendTo($('#emsg_first_name'));
        }
        if (element.attr('name') == 'user[last_name]') {
          error.appendTo($('#emsg_last_name'));
        }
        if (element.attr('name') == 'user[first_name_kana]') {
          error.appendTo($('#emsg_first_name_kana'));
        }
        if (element.attr('name') == 'user[last_name_kana]') {
          error.appendTo($('#emsg_last_name_kana'));
        }
        if (element.attr('name') == 'user[birth_year]') {
          error.appendTo($('#emsg_birth_year'));
        }
        if (element.attr('name') == 'user[birth_month]') {
          error.appendTo($('#emsg_birth_month'));
        }
        if (element.attr('name') == 'user[birth_day]') {
          error.appendTo($('#emsg_birth_day'));
        }
      }
    });
  });
});