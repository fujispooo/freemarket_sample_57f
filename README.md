  # Overview
  ## about
   プログラミングスクールの最終課題です。４人チームでアジャイル開発をしました。作ったのは某フリーマーケットサービスのクローンサイトです。
   ![d13ab92935d6951755b368c03009e19b](https://user-images.githubusercontent.com/53245774/65754307-b95a2400-e14b-11e9-9866-7870b330dd62.gif)
  ## member
   fujispoo(スクラムマスター), domesoo, Ryousuke-Nishioka, kcazuki
  ## ER図
  ![ER図](https://user-images.githubusercontent.com/53245774/65752856-a7c34d00-e148-11e9-9dac-73fa10cc3024.png)
  
  ## メンバー毎の担当範囲
  ## どんな技術を用いて実装したか
<!-- 
  ## usersテーブル

  |Column|Type|Options|
  |------|----|-------|
  |nickname|string|null: false|
  |email|string|null: false,unipue: true|
  |password|string|null: false,unipue: true|
  |first_name|string|null: false|
  |last_name|string|null: false|
  |first_name_kana|string|null: false|
  |last_name_kana|string|null: false|
  |introduction|text|-------|
  |avatar|string|-------|
  |birth_year|integer|-------|
  |birth_month|integer|-------|
  |birth_day|integer|-------|  
  |phone_number|integer|null: false,unipue: true|

  ### Association
  - has_many :sns_credentials
  - has_one  :addresses
  - has_one  :cards
  - has_many :transaction_users,  dependent:  :destroy
  - has_many :transactions, through: :transaction_users, dependent: :destroy
  - has_many :items
  - has_many :item_comments


  ## addressesテーブル

  |Column|Type|Options|
  |------|----|-------|
  |post_number|integer|null: false|
  |city|string|null: false|
  |address|string|null: false|
  |bulding_name|string|-------|
  |building_tel|integer|-------|
  |user_id|references|null: false, foreign_key: true|

  ### Association
  - belongs_to :user


  ## cardsテーブル

  |Column|Type|Options|
  |------|----|-------|
  |card_number|integer|null: false|
  |explation_month|integer|null: false|
  |explation_year|integer|null: false|
  |security_code|integer|null: false|
  |user_id|references|null: false, foreign_key: true|

  ### Association
  - belongs_to :user


  ## sns_credentialsテーブル
  uid=user_identifier

  |Column|Type|Options|
  |------|----|-------|
  |sns_name|string|-------|
  |uid|string|-------|
  |user_id|references|foreign_key: true|

  ### Association
  - belongs_to :user


  ## itemsテーブル

  |Column|Type|Options|
  |------|----|-------|
  |name|string|null: false, index: true|
  |description|text|null: false|
  |category_id|references|null: false, foreign_key: true|
  |size_id|references|null: false, foreign_key: true|
  |brand_id|references|foreign_key: true|
  |item_state_id|references|null: false, foreign_key: true|
  |delivery_fee_id|references|null: false, foreign_key: true|
  |delivery_method_id|references|null: false, foreign_key: true|
  |delivery_day_id|references|null: false, foreign_key: true|
  |price|integer|null: false|
  |user_id|references|null: false, foreign_key: true|

  ### Association
  - has_many :item_comments
  - has_many :item_images
  - has_many :transactions, dependent: :destroy
  - belongs_to :user
  - belongs_to :brand
  - belongs_to :profit
  - belongs_to :item_state
  - belongs_to :size
  - belongs_to :delivery_fee
  - belongs_to :delivery_method
  - belongs_to :delivery_day
  - belongs_to :category


  ## item_imagesテーブル

  |Column|Type|Options|
  |------|----|-------|
  |image|string|null: false|
  |item_id|references|null: false, foreign_key: true|

  ### Association
  - belongs_to :item


  ## categoriesテーブル

  |Column|Type|Options|
  |------|----|-------|
  |name|string|null: false|
  |ancestry|string|-------|

  ### Association
  - has_many :items
  - has_many :category_sizes
  - has_many :sizes, through: :category_sizes
  - has_ancestry
  

  ## sizesテーブル

  |Column|Type|Options|
  |------|----|-------|
  |size|string|-------|
  |ancestry|string|-------|

  ### Association
  - has_many :items
  - has_many :category_sizes
  - has_many :categories, through: :category_sizes
  - has_ancestry

  ## category_sizesテーブル

  |Column|Type|Options|
  |------|----|-------|
  |category_id|references|foreign_key: true|
  |size_id|references|foreign_key: true|

  ### Association
  - belongs_to :category
  - belongs_to :size
  

  ## brandsテーブル

  |Column|Type|Options|
  |------|----|-------|
  |name|string|-------|

  ### Association
  - has_many :items


  ## profitsテーブル

  |Column|Type|Options|
  |------|----|-------|
  |commission|integer|null: false|
  |profit|integer|null: false|
  |item_id|references|null: false, foreign_key: true|

  ### Association
  - has_many :items


  ## item_commentsテーブル

  |Column|Type|Options|
  |------|----|-------|
  |comment|text|-------|
  |user_id|references|null: false, foreign_key: true|
  |item_id|references|null: false, foreign_key: true|

  ### Association
  - belongs_to :user
  - belongs_to :item



  ## item_statesテーブル(マスタ)

  |Column|Type|Options|
  |------|----|-------|
  |state|string|null: false|

  ### Association
  - has_many :items


  ## delivery_feesテーブル(マスタ)

  |Column|Type|Options|
  |------|----|-------|
  |fee|string|null: false|

  ### Association
  - has_many :items


  ## delivery_methodsテーブル(マスタ)

  |Column|Type|Options|
  |------|----|-------|
  |method|string|null: false|

  ### Association
  - has_many :items


  ## delivery_daysテーブル(マスタ)

  |Column|Type|Options|
  |------|----|-------|
  |day|string|null: false|

  ### Association
  - has_many :items


  ## transactionsテーブル

  |Column|Type|Options|
  |------|----|-------|
  |item_id|references|null: false, foreign_key: true|
  |user_id|references|null: false, foreign_key: true|
  |transaction_state_id|references|null: false, foreign_key: true|
  |buyer_id|references|null: false, foreign_key: true|

  ### Association
  - has_many :transaction_users,  dependent:  :destroy
  - has_many :users, through: :transaction_users, dependent: :destroy
  - belongs_to :item
  - belongs_to :transaction_state
  - belongs_to :buyer,class_name:"User"


  ## transaction_usersテーブル

  |Column|Type|Options|
  |------|----|-------|
  |user_id|references|null: false, foreign_key: true|
  |transaction_id|references|null: false, foreign_key: true|

  ### Association
  - belongs_to :transaction
  - belongs_to :user


  ## transaction_statesテーブル(マスタ)

  |Column|Type|Options|
  |------|----|-------|
  |state|string|-------|

  ### Association
  - has_many :transactions

  ```ruby:qiita.rb
  puts 'The best way to log and share programmers knowledge.'
  ``` -->