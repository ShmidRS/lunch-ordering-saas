source 'https://rubygems.org'
ruby '2.4.2'

gem 'bootstrap'
gem 'carrierwave'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'figaro'
gem 'fog'
gem 'fog-aws'
gem 'haml'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'pg', '0.19'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.4'
gem 'redis', '~> 3.0'
gem 'rubocop'
gem 'sass-rails', '~> 5.0'
gem 'simple_form'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :test, :development, :staging, :production do
  gem 'ffaker'
end

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'factory_girl_rails'
  gem 'selenium-webdriver'
end

group :test do
  gem 'rails-controller-testing'
  gem 'rspec-rails'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :staging, :production do
  gem 'rails_12factor'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
