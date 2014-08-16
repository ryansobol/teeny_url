require 'bundler'
Bundler.require

class TeenyURL < Sinatra::Base
  enable :static
  enable :method_override

  set :views, File.join(settings.root, 'app/views')
  set :public_folder, File.join(settings.root, 'app/assets')

  configure do
    Mongoid.load!('config/mongoid.yml', settings.environment)
  end

  helpers do
    def short_url(link)
      "http://#{request.host}:#{request.port}/#{link.slug}"
    end
  end
end

require_relative 'app/models/link'
require_relative 'app/routes/404'
require_relative 'app/routes/root'
require_relative 'app/routes/slug'

run TeenyURL.new
