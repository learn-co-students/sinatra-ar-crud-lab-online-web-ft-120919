
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    @articles = Article.all
    erb :index
  end

# index displays all articles
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  # new displays create article form
  get '/articles/new' do
    erb :new
  end

  #create creates one article
  post "/articles" do
    @article = Article.create(params)
    redirect to "/articles/#{@article.id}"
  end

  #show displays one article based on ID in the url
  get "/articles/:id" do
    @article = Article.find_by_id(params[:id])
    erb :show
  end

  # edit displays edit form based on ID in the url
  get "/articles/:id/edit" do
    @article = Article.find_by_id(params[:id])
    erb :edit
  end

  #update modifies an existing article based on ID in the url
  patch "/articles/:id" do
    @article = Article.find_by_id(params[:id])
    #binding.pry
    @article.update(params["article"])
    redirect to "/articles/#{@article.id}"
  end

  #update
  put "/articles/:id" do

  end


  # delete
  delete "/articles/:id" do
    @article = Article.find_by_id(params[:id])
    @article.destroy
    redirect to "/articles"
  end


end
