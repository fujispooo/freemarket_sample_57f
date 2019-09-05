class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  if Rails.env.development?
    storage :fog
  elsif Rails.env.test?
    storage :fog
  else
    storage :fog
  end

  include CarrierWave::MiniMagick

  process resize_to_fit: [150, 150]
end
