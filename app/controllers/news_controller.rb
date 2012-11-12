class NewsController < ApplicationController
	layout 'news'

	def index
		@articles = Article.posted.page(params[:page])
	end

	def show
		@article = Article.find_by_slug(params[:id])		
	end
end
