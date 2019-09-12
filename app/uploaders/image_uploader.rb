class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  if Rails.env.development?
    storage :file
  elsif Rails.env.test?
    storage :fog
  else
    storage :fog
  end

  include CarrierWave::MiniMagick

  process resize_to_fit: [1500, 1500]
end
