$(document).on('turbolinks:load', function(){
  $(function(){
    $('.main-visual').slick({
      autoplay: true,
      autoplaySpeed: 4000,
      dots: true,
    });
  })
});