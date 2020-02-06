
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles' do
      @articles = Article.all

    erb :index
  end

  get '/articles/new' do 
   
    erb :new
end
post '/articles' do
  @article = Article.new(:title => params[:title], :content => params[:content])
	 @article.save
  
  
    redirect "/articles/#{@article.id}"
  
end
get '/articles/:id' do 
# binding.pry
@article = Article.find_by(id: params[:id])
  erb :show
end
get '/articles/:id/edit' do
  @article = Article.find_by(id: params[:id])
  # @article.update
erb :edit
end 

patch '/articles/:id' do
  # binding.pry
  id = params["id"]
  params = {}
  @articles = Article.find_by(id)
  params[:title] = params["title"]
  params[:content] = params["content"]
  articles.update(params)


  redirect "/articles/#{id}"
end
delete '/articles/:id/delete' do
  @articles = Article.find(params["id"])
  @articles.destroy
  erb :delete
end
end