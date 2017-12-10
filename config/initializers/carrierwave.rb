class Configuration
  def self.fog(config)
    config.fog_directory = ''
    config.fog_public = true
    config.fog_attributes = { 'Cache-Control' => 'max-age=315576000' }
  end
end

CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['s3_access_key'],
      aws_secret_access_key: ENV['s3_secret_access_key'],
      region: ENV['s3_region']
    }
    config.storage = :fog
    config.fog_directory = ENV['s3_fog_directory']
    config.fog_public = true
    config.fog_attributes = { 'Cache-Control' => 'max-age=315576000' }
  end

  if Rails.env.developing? || Rails.env.staging?
    config.fog_credentials = {
      provider: 'AWS', # required
      aws_access_key_id: ENV['s3_access_key'],
      aws_secret_access_key: ENV['s3_secret_access_key'],
      region: ENV['s3_region']
    }
    config.storage = :fog
    config.fog_directory = ENV['s3_fog_directory']
  end

  if Rails.env.test? || Rails.env.development?
    config.storage = :file
    config.enable_processing = true
    config.cache_dir = "#{Rails.root}/tmp/uploads"

    Configuration.fog(config)
  end
end
