require 'sinatra/base'
require 'sinatra/reloader'
require 'slim'
require 'sass'
require "sinatra/activerecord"

#class Book < ActiveRecord::Base
#end

class MyApp < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  configure(:development){ register Sinatra::Reloader }

  get '/' do
    slim :index  # renders views/index.slim
  end

  get '/screen.css' do
    sass :screen  # renders views/screen.sass as screen.css
  end
end
