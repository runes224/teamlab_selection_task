source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'rails', '~> 5.2.3'
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'bootsnap', '>= 1.1.0', require: false
# CORSを回避する
gem 'rack-cors'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # APIのドキュメントを自動で生成
  gem 'autodoc'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # モデルにスキーマ情報を追記
  gem 'annotate'
  gem 'debase'
  gem 'ruby-debug-ide'
end

group :test do
  # テストデータの生成
  gem 'factory_bot_rails'
  # Rspec
  gem 'rspec-rails'
  gem 'rspec_junit_formatter'
end