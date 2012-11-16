class StaticController < ApplicationController
	def landing
		render layout: false
	end
end
