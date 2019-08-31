class ItemImage < ApplicationRecord
  belongs_to :item

  # def add_images(item_image_params) ##レコードに画像を追加する
  #   return false if item_image_params[:images].nil?
  #   add = ItemImage.new(item_image_params)
  #   self.update_attributes(images: self.item_images + add.images)
  # end



end
