require 'sinatra/base'
require 'sinatra/reloader'
require 'slim'
require 'sass'

class MyApp < Sinatra::Base
  configure(:development){ register Sinatra::Reloader }

  get '/' do
    slim :index  # renders views/index.slim
  end

  get '/screen.css' do
    sass :screen  # renders views/screen.sass as screen.css
  end
end
