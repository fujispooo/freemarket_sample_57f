Rails.application.routes.draw do

# 本家のメルカリのパスに合わせるためscopeを用いてルーティングを作成した

  # deviseGem配下で動くもの
  devise_for :users, controllers:{
    sessions: 'users/sessions',
    registrations: 'user/registrations',
    # google,facebook連携ログイン用
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  
  scope :jp do
    # 商品一覧表示（トップページ）
    get '/'                => 'items#index'  ,as: "root"
    # 商品詳細ページ
    # get 'items/:id'      => 'items#show' (なんかこれがあると商品出品ページに飛べないので後で要確認)
    scope :mypage do
      get '/'              => 'users#mypage' ,as: "mypage"
      get 'profile'        => 'users#show'
      get 'identification' => 'users#identification'
      get 'logout'         => 'users#logout'
      get 'myitems'        => 'users#myitems'
      resources :cards, only: [:new] do
        collection do
          get  'show'      => 'cards#show'
          post 'pay'       => 'cards#pay'
          # 登録カード情報の削除
          post 'delete'    => 'cards#delete'
          # カード情報の登録のアクション
          get  'add'       => 'cards#add'
          # 購入内容の確認ページ
          get  'index'     => 'cards#index',as:"purchase"
          # カード決済のアクション
          post 'paypay'    => 'cards#paypay'
        end
      end
    end
    
    scope :transaction do
      scope :buy do
        get 'm[:id]/sell'  => 'items#transaction'
      end
    end
    # resources :item_images, only: [:create,:destroy,:update], defaults: { format: 'json' }
    #商品周りのルート
    resources :items, only: [:show, :new,:create, :edit, :update, :destroy] do
      #商品出品ページに関する、Ajaxで動くアクションのルートを作成
      collection do
        get 'purchase'     => 'items#purchase'
        get 'get_category_children', defaults: { format: 'json' }
        get 'get_category_grandchildren', defaults: { format: 'json' }
        get 'get_size', defaults: { format: 'json' }
      end
      resources :item_comments, only: [:create] do
      end
    end
  end
  
  # ユーザ新規会員登録ページ
  devise_scope :user do
    scope :jp do
      scope :signup do
        get  '/'                    => 'users/registrations#new'
        get  'registration'         => 'users/registrations#step1'
        get  'ms_confirmation'      => 'users/registrations#step2'
        get  'sms_confirmation/sms' => 'users/registrations#step3'
        get  'address'              => 'users/registrations#step4'
        get  'credit'               => 'users/registrations#step5'
        post 'registration/create'  => 'users/registrations#create'
        get  'check'                => 'users/registrations#check'
        get  'emailCheck'           => 'users/registrations#email_check'
      end
    end
  end
end