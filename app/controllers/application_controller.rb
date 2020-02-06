
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
    params.delete(:submit)
    @article = Article.create(params)
    redirect("/articles/#{@article.id}")
    # binding.pry

  end

  get '/articles/:id' do
    
    @article = Article.find_by(params[:id])
    erb :show
    # binding.pry
  end

  get '/articles' do
    @articles = Article.all
    erb :index
    # binding.pry
  end
  get '/articles/:id/edit' do
    erb :edit
    # binding.pry
  end

  patch '/articles/:id' do
    
  end
end
