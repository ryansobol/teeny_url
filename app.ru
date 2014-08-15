require 'bundler'
Bundler.require

require_relative 'app/models/link'

class TeenyUrl < Sinatra::Base
  configure do
    Mongoid.load!('config/mongoid.yml', settings.environment)
  end

  set :views, File.join(settings.root, 'app/views')

  get '/' do
    @links = Link.desc(:created_at).limit(10)
    slim :index
  end

  post '/' do
    @link = Link.find_or_create_by(url: params[:url])
    @link.save

    redirect "/#{@link.slug}/info"
  end

  get '/:slug' do |slug|
    @link = Link.find_by(slug: slug)
    redirect '/' if @link.nil?

    @link.inc(count: 1)
    redirect @link.url
  end

  use Rack::MethodOverride

  delete '/:slug' do |slug|
    @link = Link.find_by(slug: params[:slug])
    @link.destroy

    redirect '/'
  end

  get '/:slug/info' do |slug|
    @link = Link.find_by(slug: slug)
    redirect '/' if @link.nil?

    slim :info
  end
end

run TeenyUrl.new
