class NewsController < ApplicationController
	def index
		@categories = Category.all
		@acticles = Article.posted.page(params[:page]).per(10)
	end


	def show
		@article = Article.find_by_slug(params[:id])
		
	end
end
