get '/' do
  @links = Link.desc('created_at').limit(10)

  erb :index
end

post '/' do
  Link.find_or_create_by(url: params[:url])

  redirect to('/')
end
