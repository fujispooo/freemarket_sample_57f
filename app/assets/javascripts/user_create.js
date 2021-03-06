window.addEventListener("turbolinks:load", function() {
  userAttrNames = ['nickname','email','password','password_confirmation','first_name','last_name','first_name_kana','last_name_kana','birth_year','birth_month','birth_day','phone_number']
  addressAttrNames =['post_number','city','address','building_name','building_tel']
  
  //バリデーションを定義
    //全角カタカナ
    jQuery.validator.addMethod("katakana", function(value, element) {
      return this.optional(element) || /^([ァ-ヶー]+)$/.test(value);
    });
    //電話番号
    jQuery.validator.addMethod("telnum", function(value, element) {
      return this.optional(element) || /^0[0-9-]{9,11}$/.test(value);
    });
    //郵便番号
    jQuery.validator.addMethod("postnum", function(value, element) {
      return this.optional(element) || /^\d{3}\-\d{4}$/.test(value);
    });
    //オリジナルemail
    jQuery.validator.addMethod("emailfilter", function(value, element) {
      return this.optional(element) || /^[a-zA-Z\d]+((?!\-{2,})[\w+\-])+[a-zA-Z\d]@[a-z\d]+(\.[a-z]+)*\.[a-z]+$/.test(value);
    });


  // フォームの項目ごとのバリデーション
  $("#user_signup-form").validate({
    rules : {
      "user[nickname]"                         :{required: true,minlength: 2,maxlength: 10},
      "user[email]"                            :{required: true,emailfilter: true},
      "user[password]"                         :{required: true,minlength: 7},
      "user[password_confirmation]"            :{required: true,minlength: 7,equalTo: "#user_password"},
      "user[first_name]"                       :{required: true},
      "user[last_name]"                        :{required: true},
      "user[first_name_kana]"                  :{required: true,katakana: true},
      "user[last_name_kana]"                   :{required: true,katakana: true},
      "user[birth_year]"                       :{required: true},
      "user[birth_month]"                      :{required: true},
      "user[birth_day]"                        :{required: true},
      "user[phone_number]"                     :{required: true,telnum: true },
      "user[address_attributes][post_number]"  :{required: true,postnum: true},
      "user[address_attributes][city]"         :{required: true},
      "user[address_attributes][address]"      :{required: true},
      "user[address_attributes][building_name]":{maxlength: 25 },
      "user[address_attributes][building_tel]" :{telnum: true  }
    },
    // エラーメッセージ
    messages : {
      "user[nickname]":{
        required: "※ ニックネーム は必須項目です",
        minlength: "※ 2文字以上で入力してください",
        maxlength: "※ 10文字以内で入力してください"
      },
      "user[email]":{
        required: "※ メールアドレス は必須項目です",
        emailfilter: "※ 不正なメールアドレスです"
      },
      "user[password]":{
        required: "※ パスワード は必須項目です",
        minlength: "※ 7文字以上で入力してください"
      },
      "user[password_confirmation]":{
        required: "※ パスワード再認証 は必須項目です",
        minlength: "※ 7文字以上で入力してください",
        equalTo: "※ passwordの確認が取れませんでした"
      },
      "user[first_name]":{
        required: "※ 姓 は必須項目です"
      },
      "user[last_name]":{
        required: "※ 名 は必須項目です"
      },
      "user[first_name_kana]":{
        required: "※ 姓(カナ) は必須項目です",
        katakana:"※ 姓(カナ) はは全角カタカナで入力してください"
      },
      "user[last_name_kana]":{
        required: "※ 名(カナ) は必須項目です",
        katakana:"※ 名(カナ) は全角カタカナで入力してください"
      },
      "user[birth_year]":{
        required: "※ \"年\" は必須項目です"
      },
      "user[birth_month]":{
        required: "※ \"月\" は必須項目です"
      },
      "user[birth_day]":{
        required: "※ \"日\" は必須項目です"
      },
      "user[phone_number]":{
        required: "※ 電話番号 は必須項目です",
        telnum: "※ 不正な電話番号が入力されました<br/><span>・0から始まる半角数字10~12桁</span><br/><span>・\"-\"(ハイフン)を抜いた連続した数字</span><br/>上記を確認し入力してください"
      },
      "user[address_attributes][post_number]":{
        required: "※ 郵便番号 は必須項目です",
        postnum: "※ 不正な郵便番号が入力されました<br/><span>・連続した数字ではありませんか？</span><br/><span>・(例)154-9999</span><br/>上記を確認し入力してください"
      },
      "user[address_attributes][city]":{
        required: "※ 市区町村 は必須項目です"
      },
      "user[address_attributes][address]":{
        required: "※ 番地 は必須項目です"
      },
      "user[address_attributes][building_name]":{
        maxlength: "※ 建物名は25文字未満で入力してください"
      },
      "user[address_attributes][building_tel]":{
        telnum: "※ 不正な電話番号が入力されました<br/><span>・0から始まる半角数字10~12桁</span><br/><span>・\"-\"(ハイフン)を抜いた連続した数字</span><br/>上記を確認し入力してください"
      }
    },
    // エラーメッセージを追加する場所を指定
    errorPlacement: function(error, element) {
      userAttrNames.forEach(attr_name => {
        if (element.attr('name') == `user[${attr_name}]`) {
          error.appendTo($(`#emsg_${attr_name}`));
        }
      });
      addressAttrNames.forEach(attr_name => {
        if (element.attr('name') == `user[address_attributes][${attr_name}]`) {
          error.appendTo($(`#emsg_${attr_name}`));
        }
      });
    }
  });
});