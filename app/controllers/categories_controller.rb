class CategoriesController < ApplicationController
	def show
		@category = Category.find_by_slug(params[:id])
		@articles = @category.articles.posted.page(params[:page]).per(10)
	end
end
