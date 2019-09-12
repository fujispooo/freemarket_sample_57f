$(function(){
  $("#user_signup-form").validate({
    rules : {
      "user[nickname]":{
        required: true,
        minlength: 6
      },
      "user[email]":{
        required: true,
        email: true
      },
      "user[password]":{
        required: true,
        password: true
      },
      "user[password_confirmation]":{
        required: true,
        password: true,
        equalTo: "#user[password]"
      },
      "user[first_name]":{
        required: true
      },
      "user[last_name]":{
        required: true
      },
      "user[first_name_kana]":{
        required: true
      },
      "user[last_name_kana]":{
        required: true
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
        required: "必須項目です"
      },
      "user[email]":{
        required: "必須項目です",
      },
      "user[password]":{
        required: "必須項目です",
      },
      "user[password_confirmation]":{
        required: "必須項目です",
      },
      "user[first_name]":{
        required: "必須項目です"
      },
      "user[last_name]":{
        required: "必須項目です"
      },
      "user[first_name_kana]":{
        rrequired: "必須項目です"
      },
      "user[last_name_kana]":{
        required: "必須項目です"
      },
      "user[birth_year]":{
        required: "必須項目です"
      },
      "user[birth_month]":{
        required: "必須項目です"
      },
      "user[birth_day]":{
        required: "必須項目です"
      }
    },
    errorPlacement: function(error, element) {
      if (element.attr('name') == 'user[nickname]') {
        error.appendTo($('#emsg_nickname'));
      }
    },
    errorPlacement: function(error, element) {
      if (element.attr('name') == 'user[email]') {
        error.appendTo($('#emsg_email'));
      }
    },
    errorPlacement: function(error, element) {
      if (element.attr('name') == 'user[password]') {
        error.appendTo($('#emsg_password'));
      }
    },
    errorPlacement: function(error, element) {
      if (element.attr('name') == 'user[password_confirmation]') {
        error.appendTo($('#emsg_password_confirmation'));
      }
    },
    errorPlacement: function(error, element) {
      if (element.attr('name') == 'user[nickname]') {
        error.appendTo($('#emsg_nickname'));
      }
    },
    errorPlacement: function(error, element) {
      if (element.attr('name') == 'user[nickname]') {
        error.appendTo($('#emsg_nickname'));
      }
    },
    errorPlacement: function(error, element) {
      if (element.attr('name') == 'user[nickname]') {
        error.appendTo($('#emsg_nickname'));
      }
    },
    errorPlacement: function(error, element) {
      if (element.attr('name') == 'user[nickname]') {
        error.appendTo($('#emsg_nickname'));
      }
    },
    errorPlacement: function(error, element) {
      if (element.attr('name') == 'user[nickname]') {
        error.appendTo($('#emsg_nickname'));
      }
    },
    errorPlacement: function(error, element) {
      if (element.attr('name') == 'user[nickname]') {
        error.appendTo($('#emsg_nickname'));
      }
    },
    errorPlacement: function(error, element) {
      if (element.attr('name') == 'user[nickname]') {
        error.appendTo($('#emsg_nickname'));
      }
    },
    errorPlacement: function(error, element) {
      if (element.attr('name') == 'user[nickname]') {
        error.appendTo($('#emsg_nickname'));
      }
    }
  });
  debugger
});