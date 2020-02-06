
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
  # @article.save
erb :edit
end 

patch '/articles/:id' do
  # binding.pry
  id = params["id"]
  new_params = {}
  old_articles = Article.find_by(id)
  new_params[:title] = params["title"]
  new_params[:content] = params["content"]
  old_post.update(new_params)

  redirect "/articles/#{id}"
end

end