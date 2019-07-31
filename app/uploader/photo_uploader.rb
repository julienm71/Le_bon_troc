class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  include CarrierWave::MiniMagick

  version :normal do
    process :efficient_conversion => [250, 250]
  end

private

  def efficient_conversion(width, height)
    manipulate! do |img|
      img.combine_options do |c|
        c.fuzz        "3%"
        c.trim
        c.resize      "#{width}x#{height}>"
        c.resize      "#{width}x#{height}<"
      end
      img
    end
  end
end

# app/uploaders/photo_uploader.rb
# class PhotoUploader < CarrierWave::Uploader::Base
#   include Cloudinary::CarrierWave

#   # Remove everything else
# end
