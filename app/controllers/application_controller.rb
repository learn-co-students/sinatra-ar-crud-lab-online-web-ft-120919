
require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do 
    erb :new
  end

  post '/articles' do 
    @a = Article.create(params[:article])
    @articles = Article.all
    # binding.pry
    erb :show 
  end

  get '/articles/:id' do 
    @article = Article.find(params[:id])
    erb :index
  end

  get '/articles/:id/edit' do
    erb :index
  end

end

# rake db:create_migration NAME=create_articles