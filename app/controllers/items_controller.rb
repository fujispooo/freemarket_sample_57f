class ItemsController < ApplicationController

  WOMAN = 1
  # JACKET = 41
  # CLOCK = 155
  # SHOES = 183

  def index
    @items = Item.order("created_at DESC").limit(4).where.not(item_state_id: 1)
    @items_for_woman = Category.get_items_for(WOMAN)
    binding.pry
    # @items_for_jacket = Category.get_items_for(JACKET)
    # @items_for_clock = Category.get_items_for(CLOCK)
    # @items_for_shoes = Category.get_items_for(SHOES)
    # @items = Item.where("category_id = '1'").order("created_at DESC").limit(4)
  end

  def show
  end

  def new
    @item = Item.new
    @item_image = ItemImage.new
    # @categories = Category.where(parent_id:nil)

      #セレクトボックスの初期値設定
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  # 以下全て、formatはjsonのみ
    # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    #@category_grandchildren = Category.find("#{params[:child_id]}").children
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def create
  end

  def purchase
  end

  def destroy
    item = Item.find(params[:id])
    if item.user_id == current_user.id
    item.destroy
    end
    redirect_to root_path
  end

  def transaction
  end
end
