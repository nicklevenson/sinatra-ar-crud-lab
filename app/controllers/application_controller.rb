
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    
  end

  get '/articles' do
    @articles = Article.all 
    erb :index
  end
  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    article = Article.create(params)
    redirect "/articles/#{article.id}"
  end

  get '/articles/:id' do 
    @article = Article.find_by(id: params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
    @id = params[:id]
    @article = Article.find_by(id: @id)
    erb :edit
  end

  patch '/articles/:id' do
    article = Article.find_by(id: params[:id])
    article.update(title: params[:title])
    article.update(content: params[:content])
    redirect "/articles/#{article.id}"
  end

  delete '/articles/:id' do
    article = Article.find_by(id: params[:id])
    article.destroy
  end

  
 
end
