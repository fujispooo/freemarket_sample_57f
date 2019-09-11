
$(document).on('turbolinks:load', function () {
  // -------------------- 商品画像選択 --------------------
  var small_image_box = $('.owl-item-inner-sub');
  var large_image_box = $('.owl-item-inner');
  var small_image_src;

  small_image_box.children('img').on('mouseover', function () {
    // 選択したsmall_imageのsrcをlarge_imageのsrcに設定
    small_image_src = $(this).attr('src');
    large_image_box.children('img').attr('src', small_image_src);
  })
  if (small_image_box.children('img').length == 5) {
    small_image_box.children('img').css({'width': '60px', 'height': '60px'});
    $('.item-main-content').css('min-height', '360px');
  } else if (small_image_box.children('img').length > 5) {
    small_image_box.children('img').css({'width': '60px', 'height': '60px'});
    $('.item-main-content').css('min-height', '420px');
  };
});