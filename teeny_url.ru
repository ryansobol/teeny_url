require 'bundler'
Bundler.require

require_relative 'app/models/link'

class TeenyUrl < Sinatra::Base
  configure do
    Mongoid.load!('config/mongoid.yml', settings.environment)
  end

  set :views, File.join(settings.root, 'app/views')

  helpers do
    def short_url(link)
      "http://#{request.host}:#{request.port}/#{link.slug}"
    end
  end

  get '/' do
    links = Link.desc(:created_at).limit(10)

    erb :index, locals: { links: links }
  end

  post '/' do
    link = Link.find_or_create_by(url: params[:url])
    link.save

    redirect "/#{link.slug}/info"
  end

  get '/:slug' do |slug|
    link = Link.find_by(slug: slug)
    redirect '/' if link.nil?

    link.inc(count: 1)
    redirect link.url
  end

  use Rack::MethodOverride

  delete '/:slug' do |slug|
    link = Link.find_by(slug: params[:slug])
    link.destroy

    redirect '/'
  end

  get '/:slug/info' do |slug|
    link = Link.find_by(slug: slug)
    redirect '/' if link.nil?

    erb :info, locals: { link: link }
  end
end

run TeenyUrl.new
