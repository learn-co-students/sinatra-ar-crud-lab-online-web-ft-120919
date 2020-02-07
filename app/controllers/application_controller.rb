
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
  end

  patch '/articles/:id' do

    @article = Article.find_by(id: params[:id])
    @article.update(title: params[:title], content: params[:content])
    # @article.update(content: params[:content])
    redirect("/articles/#{@article.id}")
  end

  get '/articles/:id/edit' do
    @article = Article.find_by(id: params[:id])
    erb :edit
  end


  get '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    erb :show
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end
  delete '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    @article.destroy
    redirect("/articles")
  end
 
end
