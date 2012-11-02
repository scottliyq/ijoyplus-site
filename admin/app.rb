#encoding: utf-8

require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
enable :sessions

require './db/model.rb'

set :database, 'sqlite3:///db/site.db'

configure do
	set :port, 5678
end

#################################### helpers
helpers do
  def format_date(time)
    time.strftime("%Y-%m-%d")
  end

  def format_time(time)
    time.strftime("%Y-%m-%d %H:%M")
  end
end

#################################### routers
get '/' do
  erb :index
end

get '/categories/new' do 
	@categories = Category.order("id desc")
	erb :"categories/new", :layout => :layout
end

post '/categories' do 
	@category = Category.create(params[:category])
	redirect back
end

get '/articles/new' do 
	@articles = Article.order('id desc').limit(5)

	erb :'articles/new', :layout => :layout
end

post '/articles' do 
	@article = Article.new(params[:article])
	flash[:error] = 'params error' unless @article.save
	redirect back
end
