class CardsController < ApplicationController

  require "payjp"

  if Rails.env.production?
    Payjp.api_key = Rails.application.credentials.payjp_private_key
  else
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
  end

  def index
    @item = Item.find(params[:item_id])
    @address = Address.find(current_user.id)
    card = Card.where(user_id: current_user.id).first
    #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to action: "new"
    else
      Payjp.api_key
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def paypay
    card = current_user.card
    Payjp.api_key
    Payjp::Charge.create(
    amount: params[:item][:item_price], #支払金額を入力（itemテーブル等に紐づけても良い）
    customer: card.customer_id, #顧客ID
    currency:'jpy', #日本円
  )
  item = Item.find(card_params[:id])
  item.destroy
  redirect_to root_path #完了画面に移動
  end

  def new
    card = Card.where(user_id: current_user.id)
    redirect_to cards_path if card.exists?
  end

  def pay #payjpとCardのデータベース作成を実施します。
    Payjp.api_key
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        card: params['payjp-token'],
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        card = Card.where(user_id: current_user.id)
        redirect_to cards_path
      else
        redirect_to action: "pay"
      end
    end
  end
  
  def delete #PayjpとCardデータベースを削除します
    card = Card.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
    redirect_to action: "add"
  end

  def add
  end


  def show #Cardのデータpayjpに送り情報を取り出します
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  private
  def card_params
    params.require(:item).permit(:id)
  end
end

