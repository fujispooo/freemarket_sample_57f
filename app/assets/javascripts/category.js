window.addEventListener("turbolinks:load", function() {
  $(function(){
    // カテゴリーセレクトボックスのオプションを作成
    function appendOption(category){
      var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
      return html;
    }
    // 子カテゴリーの表示作成
    function appendChidrenBox(insertHTML){
      var childSelectHtml = '';
      childSelectHtml = `<div class="sell-inner__form__content__right__genre__select" id= "children_wrapper">
                          <i class="fa fa-chevron-down"></i>
                          <select id="child_category" name="category_id">
                          <option value="---" data-category="---">---</option>
                            ${insertHTML}
                          </select>
                        </div>`;
      $('#sell-inner__form__content__right__genre_hogehoge').append(childSelectHtml);
    }
    // 孫カテゴリーの表示作成
    function appendGrandchidrenBox(insertHTML){
      var grandchildSelectHtml = '';
      grandchildSelectHtml = `<div class="sell-inner__form__content__right__genre__select" id= "grandchildren_wrapper">
                                <i class="fa fa-chevron-down"></i>
                                <select id="grandchild_category" name="category_id">
                                  <option value="---">---</option>
                                  ${insertHTML}
                                </select>
                              </div>`;
      $('#sell-inner__form__content__right__genre_hogehoge').append(grandchildSelectHtml);
    }
    // 親カテゴリー選択後のイベント
    $('#parent_category').on('change', function(){
      var parentCategory = document.getElementById('parent_category').value; //選択された親カテゴリーの名前を取得

      if (parentCategory != "---"){ //親カテゴリーが初期値でないことを確認
        $.ajax({
          url: 'get_category_children',
          type: 'GET',
          data: { parent_id: parentCategory },
          dataType: 'json'
        })
        .done(function(children){
          $('children_wrapper').remove(); //親が変更された時、子以下を削除するする
          $('#grandchildren_wrapper').remove();
          $('#size_wrapper').remove();
          $('#brand_wrapper').remove();
          var insertHTML = '';
          children.forEach(function(child){
            insertHTML += appendOption(child);
          });
          appendChidrenBox(insertHTML);
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
      }else{
        $('#children_wrapper').remove(); //親カテゴリーが初期値になった時、子以下を削除するする
        $('#grandchildren_wrapper').remove();
        $('#size_wrapper').remove();
        $('#brand_wrapper').remove();
      }
    });
    // 子カテゴリー選択後のイベント
    $('#sell-inner__form__content__right__genre_hogehoge').on('change', '#child_category', function(){
    //$('#child_category').on('change', function(){
      var childId = $('#child_category option:selected').data('category'); //選択された子カテゴリーのidを取得
      if (childId != "---"){ //子カテゴリーが初期値でないことを確認
        $.ajax({
          url: 'get_category_grandchildren',
          type: 'GET',
          data: { child_id: childId },
          dataType: 'json'
        })
        .done(function(grandchildren){
          if (grandchildren.length != 0) {
            $('#grandchildren_wrapper').remove(); //子が変更された時、孫以下を削除するする
            $('#size_wrapper').remove();
            $('#brand_wrapper').remove();
            var insertHTML = '';
            grandchildren.forEach(function(grandchild){
              insertHTML += appendOption(grandchild);
            });
            appendGrandchidrenBox(insertHTML);
          }
        })
        .fail(function(){
          alert('孫カテゴリー取得に失敗しました');
        })
      }else{
        $('#grandchildren_wrapper').remove(); //子カテゴリーが初期値になった時、孫以下を削除する
        $('#size_wrapper').remove();
        $('#brand_wrapper').remove();
      }
    });
  });

  $(function(){
    // サイズセレクトボックスのオプションを作成
    function appendSizeOption(size){
      var html = `<option value="${size.id}">${size.name}</option>`;
      return html;
    }
    // サイズ・ブランド入力欄の表示作成
    function appendSizeBox(insertHTML){
      var sizeSelectHtml = '';
      sizeSelectHtml = `<div class="sell-inner__form__content__right__genre_size" id= "size">
                          <label>サイズ</label>
                          <span>必須</span>
                          <div class="sell-inner__form__content__right__genre_select" id= "size_wrapper">
                            <i class="fa fa-chevron-down"></i>
                            <select id="size" name="item[size_id]">
                            <option value="---">---</option>
                              ${insertHTML}
                            </select>
                          </div>
                        </div>`;
      $('#sell-inner__form__content__right__genre_hogehoge').append(sizeSelectHtml);
    }
    // 孫カテゴリー選択後のイベント
    $('#sell-inner__form__content__right__genre_hogehoge').on('change', '#grandchild_category', function(){
      var grandchildId = $('#grandchild_category option:selected').data('category'); //選択された孫カテゴリーのidを取得
      if (grandchildId != "---"){ //孫カテゴリーが初期値でないことを確認
        $.ajax({
          url: 'get_size',
          type: 'GET',
          data: { grandchild_id: grandchildId },
          dataType: 'json'
        })
        .done(function(sizes){
          $('#size').remove(); //孫が変更された時、サイズ欄以下を削除する
          if (sizes.length != 0) {
          var insertHTML = '';
            sizes.forEach(function(size){
              insertHTML += appendSizeOption(size);
            });
            appendSizeBox(insertHTML);
          }
        })
        .fail(function(){
          alert('サイズ取得に失敗しました');
        })
      }else{
        $('#size').remove(); //孫カテゴリーが初期値になった時、サイズ欄以下を削除する
        $('#brand_wrapper').remove();
      }
    });
  });
});