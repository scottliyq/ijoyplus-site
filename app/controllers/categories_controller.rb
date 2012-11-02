class CategoriesController < ApplicationController
	def show
		@category = Category.find_by_slug(params[:id])
		@articles = @category.articles.page(params[:page])
	end
end
