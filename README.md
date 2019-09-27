  # Overview

  ## about
   プログラミングスクールの最終課題です。４人チームでアジャイル開発をしました。作ったのは某フリーマーケットサービスのクローンサイトです。
   ![d13ab92935d6951755b368c03009e19b](https://user-images.githubusercontent.com/53245774/65754307-b95a2400-e14b-11e9-9866-7870b330dd62.gif)

  ## ER図
  ![ER図](https://user-images.githubusercontent.com/53245774/65752856-a7c34d00-e148-11e9-9dac-73fa10cc3024.png)
  ## fujispoooの担当範囲

  #### フロントエンド
  ###### ユーザ新規登録ページ
  ![85a58222b3ea2869245522d3d65482aa](https://user-images.githubusercontent.com/53245774/65762506-1eb61100-e15c-11e9-8c09-6c8e3b09367e.gif)
  ###### ユーザマイページ
  ![7693f9d732f1dfb8fed61e3ac7a097bf](https://user-images.githubusercontent.com/53245774/65762393-e44c7400-e15b-11e9-9c7b-afd5208fc3c5.gif)

  #### サーバーサイド
  ###### ルーティング構築
  本家のフリーマーケットサイトのurlに合わせるためにscorpメソッドを用いて実装しています.

  ```
 scope :jp do
      scope :signup do
        get  '/'                    => 'users/registrations#new'
```

  ###### ユーザ新規登録機能
  sessionを用いて複数ページに入力された情報を引き継ぎつつ、ユーザ登録を行う機能を実装。また、同時に複数のテーブルに情報を保存するためにfildes_forメソッドを用いたフォームも扱いました。
  ```
  def step2
    @user = User.new()
    session[:nickname]        = user_params[:nickname]
  ```

  ```
  = form_for @user, url: registration_create_path,html:{id:"user_signup-form" }, method: :post do |f|
    = f.fields_for :address do |a|
      .sign-up__main__header 
        %h2.sign-up__main__header__main-title 発送・お届け先住所入力
      .sign-up__main__body
        .sign-up__main__body__forms-container
          .sign-up__main__body__forms-container__form-box
            = a.label :name, "郵便番号"
            = a.label :name, "必須", class: "write-must"
  ```
  ###### sns認証を用いたログイン機能
  omniauthを用いてfacebookとgoogleのアカウント情報を用いてログイン可能です。
  ###### 商品削除機能

  #### その他
  ###### デプロイ
  awsのサービス（EC2,S3）を用いてデプロイをしました。
  http://13.114.65.20/jp でアクセス可能です。basic認証をかけていますので、ご閲覧希望の際はご連絡ください。

  ###### スクラムマスター
  ウィクリースクラム、デイリースクラムを立てアジャイル開発をしました。
  ###### データベース設計（補助）


 
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