class CategoriesController < ApplicationController
	layout 'news'
	def show
		@category = Category.find_by_slug(params[:id])
		@articles = @category.articles.posted.page(params[:page])
	end
end
