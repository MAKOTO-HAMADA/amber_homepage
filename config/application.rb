require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Amber
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.0
    config.paths.add 'lib', eager_load: true # 自作したライブラリを読み込む為
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    
    # Railsアプリケーションを国際化(i18n)という仕組み使って日本語対応させる
    config.i18n.default_locale = :ja
    # タイムゾーンをＵＴＣ(協定時) → 日本時間に変更する
    config.time_zone = 'Tokyo'
    # errorメッセージが表示される際のレイアウト崩れを防ぐ
    config.action_view.field_error_proc = Proc.new { |html_tag, instance| html_tag }
  end
end