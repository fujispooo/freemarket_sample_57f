class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  # before_action :user_login,only:[:new, :show]

  def index
    @item = Item.order("created_at DESC").limit(4).where.not(item_state_id: 2)
    @items_for_woman = Category.get_items_for(1).first(4)
    @items_for_man = Category.get_items_for(200).first(4)
    @items_for_sports = Category.get_items_for(399).first(4)
    @items_for_interior = Category.get_items_for(598).first(4)
  end
  
  def show
    @item = Item.find(params[:id])
    @images = @item.item_images
    @item_user = Item.where("user_id = ?", @item.user_id).order("created_at asc").limit(3)
    @products = Item.order("RAND()").limit(3)
    @next_item = Item.where("id > ?", @item.id).order("id ASC").first
    @prev_item = Item.where("id < ?", @item.id).order("id DESC").first
    @comments = @item.item_comments.includes(:user).order("id DESC")
  end

  def new
    @item = Item.new
    10.times{@item.item_images.build}
    #セレクトボックスの初期値設定
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    @category_parent_array = Category.where(ancestry: nil)
  end
  
  # 以下全て、formatはjsonのみ
  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find("#{params[:parent_id]}").children
  end
  
  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
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
    @item = Item.new(item_params)
    if @item.save
      redirect_to :root
    else
      redirect_to :new_item
    end
  end
  # ----------------------------------------------------
  def edit
    @item = Item.find(params[:id])
    @images = @item.item_images
    # @item.item_images.cache! unless @item.item_images.blank?
    @category_parent_array = Category.where(ancestry: nil)
    @category_child_array = @item.category.parent.siblings
    @category_grandchild_array = @item.category.siblings


  end

  def update
    @item = Item.find(params[:id])
    @images = @item.item_images
    # @images = ItemImage.where(item_id:params[:id])
    # binding.pry
    if @item.update(item_params)
      redirect_to root_path, notice: '商品を編集しました'
    else
      render :edit
    end
  end

# ------------------------------------------------------
  def destroy
    item = Item.find(params[:id])
    if item.user_id == current_user.id
      item.destroy
    end
    redirect_to root_path
  end

  def transaction
  end


  private
  def item_params
    params.require(:item).permit(
      :name,
      :description,
      :brand,
      :item_state_id,
      :delivery_fee_id,
      :delivery_method_id,
      :delivery_day_id,
      :price,
      :category_id,
      :prefecture_id,
      :size_id,
      item_images_attributes: [:image, :id]
    ).merge(user_id: current_user.id)
  end
end