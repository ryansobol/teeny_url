class TeenyUrl < Sinatra::Base
  get '/:slug/info' do |slug|
    link = Link.find_by(slug: slug)
    redirect '/' if link.nil?

    erb :info, locals: { link: link }
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
    link.destroy if link

    redirect '/'
  end
end
