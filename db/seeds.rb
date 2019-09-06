
# <div class="listing-product-detail__size" id= 'size_wrapper'>
# <label class="listing-default__label" for="サイズ">サイズ</label>
# <span class='listing-default--require'>必須</span>
# <div class='listing-select-wrapper__added--size'>
#   <div class='listing-select-wrapper__box'>
#     <select class="listing-select-wrapper__box--select" id="size" name="size_id>
#       <option value="---">---</option>
#       ${insertHTML}
#     <select>
#     <i class='fas fa-chevron-down listing-select-wrapper__box--arrow-down'></i>
#   </div>
# </div>
# </div>



# ↓実行済み
#レディースブロック
# #レディースの子カテゴリー配列
# lady_child_array = ['トップス','ジャケット/アウター','パンツ','スカート','ワンピース','靴','ルームウェア/パジャマ','レッグウェア','帽子','バッグ','アクセサリー','ヘアアクセサリー','小物','時計','ウィッグ/エクステ','浴衣/水着','スーツ/フォーマル/ドレス','マタニティ','その他']
# #レディースの孫カテゴリー配列
# lady_grandchild_array = [['Tシャツ/カットソー(半袖/袖なし)','Tシャツ/カットソー(七分/長袖)','シャツ/ブラウス(半袖/袖なし)','シャツ/ブラウス(七分/長袖)','ポロシャツ','キャミソール','タンクトップ','ホルターネック','ニット/セーター','チュニック','カーディガン/ボレロ','アンサンブル','ベスト/ジレ','パーカー','トレーナー/スウェット','ベアトップ/チューブトップ','ジャージ','その他'],
#                          ['テーラードジャケット','ノーカラージャケット','Gジャン/デニムジャケット','レザージャケット','ダウンジャケット','ライダースジャケット','ミリタリージャケット','ダウンベスト','ジャンパー/ブルゾン','ポンチョ','ロングコート','トレンチコート','ダッフルコート','ピーコート','チェスターコート','モッズコート','スタジャン','毛皮/ファーコート','スプリングコート','スカジャン','その他'],
#                          ['デニム/ジーンズ','ショートパンツ','カジュアルパンツ','ハーフパンツ','チノパン','ワークパンツ/カーゴパンツ','クロップドパンツ','サロペット/オーバーオール','オールインワン','サルエルパンツ','ガウチョパンツ','その他'],
#                          ['ミニスカート','ひざ丈スカート','ロングスカート','キュロット','その他'], 
#                          ['ミニワンピース','ひざ丈ワンピース','ロングワンピース','その他'], 
#                          ['ハイヒール/パンプス','ブーツ','サンダル','スニーカー','ミュール','モカシン','ローファー/革靴','フラットシューズ/バレエシューズ','長靴/レインシューズ','その他'], 
#                          ['パジャマ','ルームウェア'], 
#                          ['ソックス','スパッツ/レギンス','ストッキング/タイツ','レッグウォーマー','その他'], 
#                          ['ニットキャップ/ビーニー','ハット','ハンチング/ベレー帽','キャップ','キャスケット','麦わら帽子','その他'], 
#                          ['ハンドバッグ','トートバッグ','エコバッグ','リュック/バックパック','ボストンバッグ','スポーツバッグ','ショルダーバッグ','クラッチバッグ','ポーチ/バニティ','ボディバッグ/ウェストバッグ','マザーズバッグ','メッセンジャーバッグ','ビジネスバッグ','旅行用バッグ/キャリーバッグ','ショップ袋','和装用バッグ','かごバッグ','その他'], 
#                          ['ネックレス','ブレスレット','バングル/リストバンド','リング','ピアス(片耳用)','ピアス(両耳用)','イヤリング','アンクレット','ブローチ/コサージュ','チャーム','その他'], 
#                          ['ヘアゴム/シュシュ','ヘアバンド/カチューシャ','ヘアピン','その他'], 
#                          ['長財布','折り財布','コインケース/小銭入れ','名刺入れ/定期入れ','キーケース','キーホルダー','手袋/アームカバー','ハンカチ','ベルト','マフラー/ショール','ストール/スヌード','バンダナ/スカーフ','ネックウォーマー','サスペンダー','サングラス/メガネ','モバイルケース/カバー','手帳','イヤマフラー','傘','レインコート/ポンチョ','ミラー','タバコグッズ','その他'], 
#                          ['腕時計(アナログ)','腕時計(デジタル)','ラバーベルト','レザーベルト','金属ベルト','その他'], 
#                          ['前髪ウィッグ','ロングストレート','ロングカール','ショートストレート','ショートカール','その他'], 
#                          ['浴衣','着物','振袖','長襦袢/半襦袢','水着セパレート','水着ワンピース','水着スポーツ用','その他'], 
#                          ['スカートスーツ上下','パンツスーツ上下','ドレス','パーティーバッグ','シューズ','ウェディング','その他'], 
#                          ['トップス','アウター','インナー','ワンピース','パンツ/スパッツ','スカート','パジャマ','授乳服','その他'], 
#                          ['コスプレ','下着','その他']]
# parent = Category.create(name: 'レディース')
# lady_child_array.each_with_index do |child, i|
#   child = parent.children.create(name: child)
#   lady_grandchild_array[i].each do |grandchild|
#     child.children.create(name: grandchild)
#   end
# end

# # サイズ
#   # 洋服のサイズの子カテゴリー配列
#   huku_child_array = ['XXS以下','XS(SS)','S','M','L','XL(LL)','2XL(3L)','3XL(4L)','4XL(5L)以上','FREE SIZE']  
#   parent = Size.create(name: '洋服のサイズ')
#   huku_child_array.each_with_index do |child, i|
#     child = parent.children.create(name: child)
#   end
  
#   # 靴のサイズの子カテゴリー配列
#   kutu_child_array = ['20cm以下','20cm','21cm','22cm','23cm','24cm','25cm','26cm','27以上']  
#   parent = Size.create(name: '靴のサイズ')
#   kutu_child_array.each_with_index do |child, i|
#     child = parent.children.create(name: child)
#   end


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)





# 開発環境の時に実行
# if Rails.env == 'development'
#   ItemImage.create!(
  #     [
#       {
#         image: File.open('./app/assets/images/miyagit.jpeg'),
#         item_id: '1',
#       }
#     ]
#   )
# end
