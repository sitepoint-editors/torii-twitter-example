$:.unshift File.dirname(__FILE__)

env = (ENV["RACK_ENV"] || :development)

require 'bundler'
Bundler.require :default, env.to_sym

module Application
  include ActiveSupport::Configurable
end

Application.configure do |config|
  config.root = File.dirname(__FILE__)
  config.env = ActiveSupport::StringInquirer.new(env.to_s)
  #http://stackoverflow.com/questions/20361428/rails-i18n-validation-deprecation-warning
  I18n.config.enforce_available_locales = true
end

db_config = YAML.load(File.read("db/config.yml"))[Application.config.env]

ActiveRecord::Base.default_timezone = :utc
ActiveRecord::Base.establish_connection(db_config)
