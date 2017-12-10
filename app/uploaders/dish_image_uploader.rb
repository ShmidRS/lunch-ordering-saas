class DishImageUploader < CarrierWave::Uploader::Base

  def store_dir
    "#{Rails.env.downcase}/uploads/dish/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w[jpg jpeg gif png]
  end
end
