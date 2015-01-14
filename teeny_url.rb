require 'bundler'
Bundler.require

require_relative 'app/models/link'
require_relative 'app/controllers/404'
require_relative 'app/controllers/root'
require_relative 'app/controllers/slug'

set :root, File.join(settings.root, 'app')

Mongoid.load!('config/mongoid.yml', settings.environment)
