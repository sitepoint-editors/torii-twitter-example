$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'app'))

require File.expand_path('../environment', __FILE__)

['app/models'].each do |path|
  Dir[File.expand_path("../#{path}/*.rb", __FILE__)].each do |f|
    require f
  end
end

configure do
  use Rack::Session::Cookie, secret: "klasjdf"

  #http://stackoverflow.com/questions/13675879/activerecordconnectiontimeouterror
  use ActiveRecord::ConnectionAdapters::ConnectionManagement
  
  use OmniAuth::Builder do
    provider :twitter, ENV["TWITTER_KEY"], ENV["TWITTER_SECRET"]
  end

  OmniAuth.config.on_failure = Proc.new { |env|
    OmniAuth::FailureEndpoint.new(env).redirect_to_failure
  }
end

require 'app'
