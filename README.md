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
  ###### 単体テスト
  ###### バリデーション
  モデル、コントローラ、jsにてバリデーションを実装しました。正規表現を用いて独自バリデーションを組み、サーバー側の担保をしつつ、動的なエラー検知をJSで実装したことでユーザと開発者双方に嬉しいバリデーションを実現しました。

  ```
  # メールアドレス
    class OriginalEmailValidator < ActiveModel::EachValidator
      EMAIL_REGEX = /\A[a-zA-Z\d]+((?!\-{2,})[\w+\-])+[a-zA-Z\d]@[a-z\d]+(\.[a-z]+)*\.[a-z]+\z/i
      def validate_each(record, attribute,value)
        if value.present?
          if value.match(EMAIL_REGEX).blank?
            record.errors.add(attribute, '不正なメールアドレスです')
          end
        end
      end  
    end  
  ```

  ###### 禁止ワード検知機能
  ユーザ不健全なワードを入力した際に登録を禁止する機能を実装しました。
  ![c858b876573428ad9bb6a19bd815bf5c](https://user-images.githubusercontent.com/53245774/65763196-d3046700-e15d-11e9-8bac-7f43cb02f21c.gif)


  #### その他
  ###### デプロイ
  awsのサービス(EC2,S3)を用いてデプロイをしました。
  http://13.114.65.20/jp でアクセス可能です。basic認証をかけていますので、ご閲覧希望の際はご連絡ください。
  ![S3,EC2](https://user-images.githubusercontent.com/53245774/65764325-53c46280-e160-11e9-94af-3bf73a705f47.png)

  ###### スクラムマスター
  ウィクリースクラム、デイリースクラムを立てアジャイル開発をしました。
  ###### データベース設計（補助）
  ![ER図](https://user-images.githubusercontent.com/53245774/65752856-a7c34d00-e148-11e9-9dac-73fa10cc3024.png)
