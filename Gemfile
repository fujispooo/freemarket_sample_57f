source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'
gem 'rails', '~> 5.2.2', '>= 5.2.2.1'
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'puma', '~> 4.3'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false

group :production do
  gem 'unicorn', '5.4.1'
end

group :production,:development do
  gem 'listen', '>= 3.0.5', '< 3.2'
end

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capistrano'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano3-unicorn'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rails-erd'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'pry-rails'
gem 'haml-rails'
gem 'font-awesome-rails'
gem 'devise'
gem 'active_hash'
gem 'ancestry'
gem 'payjp'
gem "jquery-rails"
gem 'dotenv-rails'

# 画像投稿に使う
gem 'carrierwave'
gem 'fog-aws'
gem 'mini_magick'

# google,facobook連携
gem 'omniauth'
gem 'omniauth-google-oauth2'
gem 'omniauth-facebook'

# バリデーション用
gem 'jquery-validation-rails'

