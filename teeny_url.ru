require 'bundler'
Bundler.require

class TeenyUrl < Sinatra::Base
  use Rack::MethodOverride

  configure do
    Mongoid.load!('config/mongoid.yml', settings.environment)
  end

  set :views, File.join(settings.root, 'app/views')

  helpers do
    def short_url(link)
      "http://#{request.host}:#{request.port}/#{link.slug}"
    end
  end
end

require_relative 'app/models/link'
require_relative 'app/routes/root'
require_relative 'app/routes/slug'

run TeenyUrl.new
