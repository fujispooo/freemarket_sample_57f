class ItemCommentsController < ApplicationController
  def create
    comment = ItemComment.create(comment: params[:comment], item_id: params[:item_id], user_id: current_user.id)
    if comment.save
      flash[:notice] = "コメントを投稿しました"
      redirect_to "/jp/items/#{comment.item.id}"
    else
      flash[:alert] = "コメント投稿に失敗しました"
      redirect_to "/jp/items/#{comment.item.id}"
    end
  end
  private
  def comment_params
    params.permit(:comment, :item_id)
  end
end
