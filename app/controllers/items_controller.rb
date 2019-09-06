class ItemsController < ApplicationController

  # before_action :user_login,only:[:new, :show]


  WOMAN = 1
  MAN = 200
  SPORTS = 300
  INTERIOR = 400

  def index
    @items = Item.order("created_at DESC").limit(4).where.not(item_state_id: 1)
    @items_for_woman = Category.get_items_for(WOMAN)
    @items_for_man = Category.get_items_for(MAN)
    @items_for_sports = Category.get_items_for(SPORTS)
    @items_for_interior = Category.get_items_for(INTERIOR)
  end

  def show
    @item = Item.find(item_params.id)
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

  # 孫カテゴリーが選択された後に動くアクション
  def get_size
    selected_grandchild = Category.find("#{params[:grandchild_id]}") #JSから送られてきた、孫カテゴリーのidを元に、選択された孫カテゴリーのレコードを取得
    if related_size_parent = selected_grandchild.sizes[0] #孫カテゴリーと紐付くサイズ（親）があれば取得
      @sizes = related_size_parent.children #紐づいたサイズ（親）の子供の配列を取得
    else
      selected_child = Category.find("#{params[:grandchild_id]}").parent #選択された孫カテゴリーの親（子カテゴリー）のレコードを取得
      if related_size_parent = selected_child.sizes[0] #子カテゴリーと紐付くサイズ（親）があれば取得
          @sizes = related_size_parent.children #紐づいたサイズ（親）の子供の配列を取得
      end
    end
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
