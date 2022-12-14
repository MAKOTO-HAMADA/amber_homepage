source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'

# gem 'rails', '~> 5.0.0'   # バージョンアップするためコメントアウト    ... 8/9
# gem 'rails', '~> 7.0.3.1'   # 現時点最新のRailsにアップグレード       ... 8/9
gem 'rails', '~> 6.1'   # どうしようもなくダウングレード... 8/11

# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'webpacker', '~> 5.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'pry-byebug'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'devise'    # 認証機能

gem 'jp_prefecture'   # 都道府県コードから都道府県名を変換

## ActiveStorageのサードパーティーソフトウェア
gem 'rmagick'                     # ImageMajick（画像の変形や、解析等）
gem "image_processing", ">= 1.2"  # 画像の分析や画像加工
gem "enum_help"                   # enum機能実装
gem 'ransack'                     # 検索機能

## カリキュラム（デプロイを学ぼう_1章）
# 「dotenv-rails：環境変数」、「mysql2：MySQL(データベース)を使用する為」
gem 'dotenv-rails'
group :production do
  gem 'mysql2'
end

## カリキュラム（デプロイを学ぼう_1章）
# カリキュラムには特に内容の記載はなし... 8/9
gem "net-smtp"
gem "net-pop"
gem "net-imap"