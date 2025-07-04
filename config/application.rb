require_relative "boot"

require "rails/all"
Bundler.require(*Rails.groups)

module Mymosque
  class Application < Rails::Application
    config.load_defaults 6.1
    config.autoload_paths << Rails.root.join('lib')
    config.eager_load_paths << Rails.root.join('lib')
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
