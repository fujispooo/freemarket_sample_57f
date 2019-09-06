class ItemImage < ApplicationRecord
  belongs_to :item
  mount_uploader :image, ImageUploader

  def add_images(image_params) ##レコードに画像を追加する
    return false if image_params[:images].nil?
    add = ItemImage.new(image_params)
    self.update_attributes(images: self.images + add.images)
  end

  def crop_image(image_params,index_list) ##レコードの画像を置き換える（トリミング用）
    return false if image_params[:images].nil?
    crop = ItemImage.new(image_params)
    crop_index_list = index_list.split(",")
    self.images += crop.images
    length = self.images.length
    crop_index_list.sort.reverse.each_with_index do |index, i|
      self.images[index.to_i] = self.images.last
      self.images.pop
    end
    self.save
  end

  # def edit_image(image_id, delete_old_image_list) ##商品編集画面で画像を新しく追加した時
  #   delete_list = delete_old_image_list.split(",")
  #   delete_list.each do |index|
  #     self.images[0].model[:images].delete_at(index.to_i)
  #     self.images.delete_at(index.to_i)
  #   end
  #   if image_id != "null"
  #     edit_images = ItemImage.find(image_id)
  #     self.images += edit_images.images
  #     new_images = ItemImage.new(images: self.images, item_id: self.item_id)
  #     new_images.save
  #     edit_images.destroy
  #   else
  #     new_images = ItemImage.new(images: self.images, item_id: self.item_id)
  #     new_images.save
  #   end
  # end




end
