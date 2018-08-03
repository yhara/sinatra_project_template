require 'sinatra/base'
require 'sinatra/reloader'
require 'slim'
require 'sass'
require "sinatra/activerecord"

$LOAD_PATH.unshift(__dir__)
require 'flash.rb'
require 'models/book.rb'
require 'controllers/books_controller.rb'

class MyApp < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  configure(:development){ 
    register Sinatra::Reloader
    also_reload "#{__dir__}/**/*.rb"
  }

  configure do
    set :method_override, true
    set :views, "#{__dir__}/views"
  end
  
  get '/' do
    "<a href='/books'>books</a>"
  end

  get '/screen.css' do
    sass :screen  # renders views/screen.sass as screen.css
  end
end
