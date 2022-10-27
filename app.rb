require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
    configure :development do
        register Sinatra::Reloader
    end

    get '/' do
        return 'hello'
    end

    get '/hello' do
        name = params[:name]
        return "Hello #{name}!"
    end

    get '/names' do
        names = params[:names]
        return names
    end

    post '/sort_names' do
        names = params[:names]
        names_array = names.split(',')
        sorted_names = names_array.sort
        return sorted_names.join(',')
    end

end

# Incoming request: GET /todos/1   :: will execute route 1 as it matched GET an the path
# Incoming request: GET /posts     :: will give a 404 due to not path

# Routes

# 1) GET /  -> execute some code
# 2) GET /todos/1   -> execute some differet piece fo code
# 3) POST /todos   -> execute some different code