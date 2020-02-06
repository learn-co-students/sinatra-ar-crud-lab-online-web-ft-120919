
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end


  get '/articles/new' do
    #renders a form that will have a post method create new article object
    erb :new
  end

  post '/articles' do
    #creates article
    @article = Article.create(params)
    #renders article to user
    redirect to "/articles/#{ @article.id}"
  end

  get '/articles' do
    #retrieve all of the articles from ActiveRecord
    @articles = Article.all
    #render all articles on index page
    erb :index
  end 

  get '/articles/:id' do
    #retrieves an inidividual article 
    @article = Article.find(params[:id])
    #render article to user
    erb :show
  end

  get '/articles/:id/edit' do
    #retrieve an article 
    @article = Article.find(params[:id])
    #show form for editing the article to user
    erb :edit
  end

  patch '/articles/:id' do
    #update article 
    @article = Article.find(params[:id])
    @article.update(params[:article])
    #redirect to show
    redirect to "/articles/#{ @article.id }"
  end

  delete '/articles/:id' do
    Article.destroy(params[:id])
    redirect to '/articles'
  end

end
