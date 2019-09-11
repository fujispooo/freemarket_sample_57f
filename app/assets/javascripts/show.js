
$(function(){
  var small_image_box = $('.owl-item-inner-sub');
  var large_image_box = $('.owl-item-inner');
  var small_image_src;


  small_image_box.children('img').on('mouseover', function () {
  small_image_src = $(this).attr('src');
  large_image_box.children('img').attr('src', small_image_src);
  });
});