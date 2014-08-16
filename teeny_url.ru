require 'bundler'
Bundler.require

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

require_relative 'app/models/link'
require_relative 'app/routes/404'
require_relative 'app/routes/root'
require_relative 'app/routes/slug'

run Sinatra::Application.new
