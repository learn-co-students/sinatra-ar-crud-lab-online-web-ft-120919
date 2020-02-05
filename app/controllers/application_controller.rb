
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  #Create
  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    middle_article = Article.create(params)
    redirect to "/articles/#{middle_article[:id]}"
  end

  # Read
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  #Read
  get '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    erb :show
  end

  #Update
  get '/articles/:id/edit' do
    @article = Article.find_by(id: params[:id])
    erb :edit
  end

  #Update
  patch '/articles/:id' do
    # binding.pry
    old_article = Article.find_by(id: params[:id])
    
    old_article.update(:title => params[:title], :content => params[:content])

    redirect to "/articles/#{params[:id]}"
  end

  #Delete
  delete '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    @article.destroy
    redirect to "/articles"
  end
end
