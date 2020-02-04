
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end #do

  get '/' do
    redirect '/articles' 
  end #do

  get '/articles' do
    @articles = Article.all
    erb :'index'
  end

  get '/articles/new' do
    erb :'new'
  end #do

  post '/articles' do
    #binding.pry 
    @article = Article.create(params)
    redirect "/articles/#{Article.last.id}"
  end #do 

  get '/articles/:id' do
    #binding.pry 
    @article = Article.find(params[:id])
    #binding.pry 
    erb :'show'
  end #do 

  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.title = params[:title] #Is there a way to mass assign attributes?
    @article.content = params[:content]
    @article.save 
    redirect "/articles/#{@article.id}" #Does this assume'get'?
  end #do

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :'edit'
  end #do

  delete '/articles/:id' do
    @article = Article.find(params[:id])
    @article.delete 
    redirect '/articles'
  end #do

end #class
