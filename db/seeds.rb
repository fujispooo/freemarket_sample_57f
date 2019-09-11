# レディースブロック
#レディースの子カテゴリー配列
  lady_child_array = ['トップス','ジャケット/アウター','パンツ','スカート','ワンピース','靴','ルームウェア/パジャマ','レッグウェア','帽子','バッグ','アクセサリー','ヘアアクセサリー','小物','時計','ウィッグ/エクステ','浴衣/水着','スーツ/フォーマル/ドレス','マタニティ','その他']
#レディースの孫カテゴリー配列
  lady_grandchild_array = [['Tシャツ/カットソー(半袖/袖なし)','Tシャツ/カットソー(七分/長袖)','シャツ/ブラウス(半袖/袖なし)','シャツ/ブラウス(七分/長袖)','ポロシャツ','キャミソール','タンクトップ','ホルターネック','ニット/セーター','チュニック','カーディガン/ボレロ','アンサンブル','ベスト/ジレ','パーカー','トレーナー/スウェット','ベアトップ/チューブトップ','ジャージ','その他'],
                           ['テーラードジャケット','ノーカラージャケット','Gジャン/デニムジャケット','レザージャケット','ダウンジャケット','ライダースジャケット','ミリタリージャケット','ダウンベスト','ジャンパー/ブルゾン','ポンチョ','ロングコート','トレンチコート','ダッフルコート','ピーコート','チェスターコート','モッズコート','スタジャン','毛皮/ファーコート','スプリングコート','スカジャン','その他'],
                           ['デニム/ジーンズ','ショートパンツ','カジュアルパンツ','ハーフパンツ','チノパン','ワークパンツ/カーゴパンツ','クロップドパンツ','サロペット/オーバーオール','オールインワン','サルエルパンツ','ガウチョパンツ','その他'],
                           ['ミニスカート','ひざ丈スカート','ロングスカート','キュロット','その他'], 
                           ['ミニワンピース','ひざ丈ワンピース','ロングワンピース','その他'], 
                           ['ハイヒール/パンプス','ブーツ','サンダル','スニーカー','ミュール','モカシン','ローファー/革靴','フラットシューズ/バレエシューズ','長靴/レインシューズ','その他'], 
                           ['パジャマ','ルームウェア'],
                           ['ソックス','スパッツ/レギンス','ストッキング/タイツ','レッグウォーマー','その他'], 
                           ['ニットキャップ/ビーニー','ハット','ハンチング/ベレー帽','キャップ','キャスケット','麦わら帽子','その他'], 
                           ['ハンドバッグ','トートバッグ','エコバッグ','リュック/バックパック','ボストンバッグ','スポーツバッグ','ショルダーバッグ','クラッチバッグ','ポーチ/バニティ','ボディバッグ/ウェストバッグ','マザーズバッグ','メッセンジャーバッグ','ビジネスバッグ','旅行用バッグ/キャリーバッグ','ショップ袋','和装用バッグ','かごバッグ','その他'], 
                           ['ネックレス','ブレスレット','バングル/リストバンド','リング','ピアス(片耳用)','ピアス(両耳用)','イヤリング','アンクレット','ブローチ/コサージュ','チャーム','その他'], 
                           ['ヘアゴム/シュシュ','ヘアバンド/カチューシャ','ヘアピン','その他'], 
                           ['長財布','折り財布','コインケース/小銭入れ','名刺入れ/定期入れ','キーケース','キーホルダー','手袋/アームカバー','ハンカチ','ベルト','マフラー/ショール','ストール/スヌード','バンダナ/スカーフ','ネックウォーマー','サスペンダー','サングラス/メガネ','モバイルケース/カバー','手帳','イヤマフラー','傘','レインコート/ポンチョ','ミラー','タバコグッズ','その他'], 
                           ['腕時計(アナログ)','腕時計(デジタル)','ラバーベルト','レザーベルト','金属ベルト','その他'], 
                           ['前髪ウィッグ','ロングストレート','ロングカール','ショートストレート','ショートカール','その他'], 
                           ['浴衣','着物','振袖','長襦袢/半襦袢','水着セパレート','水着ワンピース','水着スポーツ用','その他'], 
                           ['スカートスーツ上下','パンツスーツ上下','ドレス','パーティーバッグ','シューズ','ウェディング','その他'], 
                           ['トップス','アウター','インナー','ワンピース','パンツ/スパッツ','スカート','パジャマ','授乳服','その他'], 
                           ['コスプレ','下着','その他']]
  parent_name = ['レディース','メンズ','インテリア','Sports']
  parent_name.each do |name|
    parent = Category.create(name: name)
    lady_child_array.each_with_index do |child, i|
      child = parent.children.create(name: child)
      lady_grandchild_array[i].each do |grandchild|
        child.children.create(name: grandchild)
      end
    end
  end


# (商品出品)itemStates------------------------------------------------------------------------------------------------

item_states = ['新品未使用','未使用に近い','目立った傷や汚れなし','やや傷や汚れあり','傷や汚れあり','全体的に状態が悪い']
item_states.each do |item_state|
  ItemState.create!(
    item_state: item_state,
  )
end

# (商品出品)deliveryFee-----------------------------------------------------------------------------------------------

delivery_fees = ['送料込み（出品者負担）','着払い（購入者負担）']
delivery_fees.each do |delivery_fee|
  DeliveryFee.create!(
    delivery_fee: delivery_fee,
  )
end

# (商品出品)deliveryDay-----------------------------------------------------------------------------------------------

DeliveryDay.create!([{delivery_day: '1~2日で発送'},{ delivery_day: '2~4日で発送' }, {delivery_day: '4~7日で発送'}])

# (商品出品)deliveryMethod--------------------------------------------------------------------------------------------

DeliveryMethod.create!([{delivery_method: '未定'},{delivery_method: 'らくらくメルカリ便'},{delivery_method: 'ゆうメール'}])




# (商品出品)サイズ-----------------------------------------------------------------------------------------------------

  # 洋服のサイズの子カテゴリー配列
  huku_child_array = ['XXS以下','XS(SS)','S','M','L','XL(LL)','2XL(3L)','3XL(4L)','4XL(5L)以上','FREE SIZE']  
  parent = Size.create(name: '洋服のサイズ')
  huku_child_array.each_with_index do |child, i|
    child = parent.children.create(name: child)
  end
  # 靴のサイズの子カテゴリー配列
  kutu_child_array = ['20cm以下','20cm','21cm','22cm','23cm','24cm','25cm','26cm','27以上']  
  parent = Size.create(name: '靴のサイズ')
  kutu_child_array.each_with_index do |child, i|
    child = parent.children.create(name: child)
  end



  # (商品出品)sizeとcategoryの中間テーブル-------------------------------------------------------------------------------

numbers = [2,21,43,56,62,78,220,242,255,261,400,419,441,454]
numbers.each do |number|
  CategorySize.create!(
    category_id: number,
    size_id: 1,
  )
end

shoes_numbers = [67,266,465]
shoes_numbers.each do |shoes_number|
  CategorySize.create!(
    category_id: shoes_number,
    size_id: 12,
  )
end


# #その他ブロック

#その他の子カテゴリー配列
# other_child_array = ['まとめ売り','ペット用品','食品','飲料/酒','日用品/生活雑貨/旅行','アンティーク/コレクション','文房具/事務用品','事務/店舗用品','その他']
# #その他の孫カテゴリー配列
# other_grandchild_array = [['すべて'], ['すべて','ペットフード','犬用品','猫用品','魚用品/水草','小動物用品','爬虫類/両生類用品','かご/おり','鳥用品','虫類用品','その他'], ['すべて','菓子','米','野菜','果物','調味料','魚介類(加工食品)','肉類(加工食品)','その他 加工食品','その他'], ['すべて','コーヒー','ソフトドリンク','ミネラルウォーター','茶','ウイスキー','ワイン','ブランデー','焼酎','日本酒','ビール、発泡酒','その他'], ['すべて','タオル/バス用品','日用品/生活雑貨','洗剤/柔軟剤','旅行用品','防災関連グッズ','その他'], ['すべて','雑貨','工芸品','家具','印刷物','その他'], ['すべて','筆記具','ノート/メモ帳','テープ/マスキングテープ','カレンダー/スケジュール','アルバム/スクラップ','ファイル/バインダー','はさみ/カッター','カードホルダー/名刺管理','のり/ホッチキス','その他'], ['すべて','オフィス用品一般','オフィス家具','店舗用品','OA機器','ラッピング/包装','その他'], ['すべて']]

# parent = Category.create(name: 'その他')
# other_child_array.each.each_with_index do |child, i|
#  child = parent.children.create(name: child)
#  other_grandchild_array[i].each do |grandchild|
#    child.children.create(name: grandchild)
#  end
# end