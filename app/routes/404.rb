class TeenyURL < Sinatra::Base
  not_found do
    erb :'404'
  end
end
