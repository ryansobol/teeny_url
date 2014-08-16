class TeenyUrl < Sinatra::Base
  get '/' do
    links = Link.desc(:created_at).limit(10)

    erb :index, locals: { links: links }
  end

  post '/' do
    link = Link.find_or_create_by(url: params[:url])

    redirect "/#{link.slug}/info"
  end
end
