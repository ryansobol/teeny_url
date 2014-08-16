require 'bundler'
Bundler.require

configure do
  set :root,        File.join(settings.root, 'app')
  set :views,       File.join(settings.root, 'views')
  set :public_dir,  File.join(settings.root, 'assets')

  Mongoid.load!('config/mongoid.yml', settings.environment)
end

require_relative 'app/models/link'
require_relative 'app/routes/404'
require_relative 'app/routes/root'
require_relative 'app/routes/slug'
