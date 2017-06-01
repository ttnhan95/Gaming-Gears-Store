class SearchesController < ApplicationController
	skip_before_action :authorize, only: [:create, :show, :new]
	def new
		@search = Search.new
		@categories = Category.all
	end

	def create
		@search = Search.create(search_params)
		redirect_to @search
	end

	def show
		@search = Search.find(params[:id])
		@categories = Category.all
	end

	private

	def search_params
		params.require(:search).permit(:keywords, :category_id, :min_price, :max_price, :isbn)
		
	end
end
