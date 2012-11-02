class NewsController < ApplicationController
	def index
		@categories = Category.all
		@acticles = Article.where(:posted => true).page(params[:page])
	end
end
