  # README

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
  |birthday|date|-------|
  |phone_number|integer|null: false,unipue: true|

  ### Association
  <!-- - has_many :rates -->
  <!-- - has_many :announcements -->
  <!-- - has_many :todos -->
  - has_many :sns_credentials
  - has_one  :addresses
  - has_one  :cards
  - has_many :transaction_users,  dependent:  :destroy
  - has_many :transactions, through: :transaction_users, dependent: :destroy
  <!-- - has_many :likes -->
  - has_many :items
  - has_many :item_comments


  ## addressesテーブル

  |Column|Type|Options|
  |------|----|-------|
  |post_number|integer|null: false|
  |prefecture_id|references|null: false,foreign_key: true|
  |city|string|null: false|
  |address|string|null: false|
  |bulding_name|string|-------|
  |building_tel|integer|-------|
  |user_id|references|null: false, foreign_key: true|

  ### Association
  - belongs_to :user
  - belongs_to :prefecture


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
  |name|string|null: false|
  |description|text|null: false|
  |category_id|references|null: false, foreign_key: true|
  |size_id|references|null: false, foreign_key: true|
  |brand_id|references|foreign_key: true|
  |item_state_id|references|null: false, foreign_key: true|
  |delivery_fee_id|references|null: false, foreign_key: true|
  |prefecture_id|references|null: false,foreign_key: true|
  |delivery_method_id|references|null: false, foreign_key: true|
  |delivery_day_id|references|null: false, foreign_key: true|
  |price|integer|null: false|
  |user_id|references|null: false, foreign_key: true|
  <!-- |like_count|integer|| -->

  ### Association
  - has_many :item_comments
  - has_many :item_images
  - has_many :transactions, dependent: :destroy
  - belongs_to :user
  - belongs_to :brand
  - belongs_to :prefecture
  - belongs_to :profit
  - belongs_to :item_state
  - belongs_to :size
  - belongs_to :delivery_fee
  - belongs_to :delivery_method
  - belongs_to :delivery_day
  - belongs_to :category
  <!-- - has_many :likes -->


  ## item_imagesテーブル

  |Column|Type|Options|
  |------|----|-------|
  |image|string|null: false|
  |item_id|references|null: false, foreign_key: true|

  ### Association
  - belongs_to :item


  ## category_grandparentsテーブル

  |Column|Type|Options|
  |------|----|-------|
  |name|string|null: false|

  ### Association
  - has_many :category_parents
  - has_many :categories


  ## category_parentsテーブル

  |Column|Type|Options|
  |------|----|-------|
  |name|string|null: false|
  |category_grandparent_id|references|null: false, foreign_key: true|

  ### Association
  - belongs_to :category_grandparent
  - has_many :categories


  ## categoriesテーブル

  |Column|Type|Options|
  |------|----|-------|
  |name|string|null: false|
  |category_grandparent_id|references|null: false, foreign_key: true|
  |category_parent_id|references|null: false, foreign_key: true|

  ### Association
  - belongs_to :category_grandparent
  - belongs_to :category_parent
  - has_many :items


  ## sizesテーブル

  |Column|Type|Options|
  |------|----|-------|
  |size|string|null: false|
  |type|string|-------|

  ### Association
  - has_many :items


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


  ## prefecturesテーブル(マスタ)

  |Column|Type|Options|
  |------|----|-------|
  |prefecture|string|-------|

  ### Association
  - has_many :items
  - has_many :addresses


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


  <!-- ## profitsテーブル

  |Column|Type|Options|
  |------|----|-------|
  |user_id|references|null: false, foreign_key: true|
  |item_id|references|null: false, foreign_key: true|

  ### Association
  - belongs_to :item
  - belongs_to :user -->

  <!-- ## ratesテーブル

  |Column|Type|Options|
  |------|----|-------|
  |rate_id|references|null: false, foreign_key: true|
  |comment|string|-------|
  |user_id|references|null: false, foreign_key: true|
  |transaction_id|references|null: false, foreign_key: true|

  ### Association
  - belongs_to :user -->

  <!-- ## announcementsテーブル

  |Column|Type|Options|
  |------|----|-------|
  |title|string|null: false|
  |text|text|null: false|
  |user_id|references|null: false, foreign_key: true|

  ### Association
  - belongs_to :user -->

  <!-- ## todosテーブル

  |Column|Type|Options|
  |------|----|-------|
  |text|text|null: false|
  |text|text|null: false|
  |user_id|references|null: false, foreign_key: true|
  |transaction_id|references|null: false, foreign_key: true|

  ### Association
  - belongs_to :user
  - belongs_to :transaction -->




  This README would normally document whatever steps are necessary to get the
  application up and running.

  Things you may want to cover:

  * Ruby version

  * System dependencies

  * Configuration

  * Database creation

  * Database initialization

  * How to run the test suite

  * Services (job queues, cache servers, search engines, etc.)

  * Deployment instructions

  * ...
