require 'bundler'
Bundler.require

require_relative 'app/models/link'
require_relative 'app/routes/404'
require_relative 'app/routes/root'
require_relative 'app/routes/slug'

set :root, File.join(settings.root, 'app')

Mongoid.load!('config/mongoid.yml', settings.environment)
