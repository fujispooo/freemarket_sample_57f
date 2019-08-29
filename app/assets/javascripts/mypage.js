window.addEventListener("load", function() {
  let tabs = document.getElementsByClassName("menu_item");
  // tabsを配列に変換する
  tabsAry = Array.prototype.slice.call(tabs);

  // クラスの切り替えをtabSwitch関数で定義
  function tabSwitch() {
    // 全てのactiveクラスのうち、最初の要素を削除（"[0]は、最初の要素の意味"）
    document.getElementsByClassName("active")[0].classList.remove("active");

    // クリックしたタブにactiveクラスを追加
    this.classList.add("active");

    // コンテンツの全てのshowクラスのうち、最初の要素を削除
    document.getElementsByClassName("show")[0].classList.remove("show");

    // 何番目の要素がクリックされたかを、配列tabsから要素番号を取得
    const index = tabsAry.indexOf(this);

    // クリックしたcoutentクラスにshowクラスを追加する
    document.getElementsByClassName("ryofujii-right-content__block__object")[index].classList.add("show");
  }

  // タブメニューの中でクリックイベントが発生した場所を探し、下で定義したtabSwitch関数を呼び出す
  tabsAry.forEach(function(value) {
    value.addEventListener("click", tabSwitch);
  });
});