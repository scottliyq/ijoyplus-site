class CategoriesController < ApplicationController
	def show
		@category = Category.find_by_slug(params[:id])
		@articles = @category.articles.page(params[:page]).per(10)
	end
end
