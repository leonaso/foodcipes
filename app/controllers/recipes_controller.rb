class RecipesController < ApplicationController
	def index
		@recipes = Recipe.all
	end

	def create
		@recipe = Recipe.new(recipe_params)  
		@recipe.chef = Chef.first
		if @recipe.save
			flash[:success] = "Recipe was created successfully"
			redirect_to recipe_path(@recipe)
		else
			render 'new'
			flash[:success] = "Recipe was not created successfully"
		end
	end

	def new
		@recipe =Recipe.new
	end

	def edit
		@recipe = Recipe.find(params[:id])
	end

	def show
		@recipe = Recipe.find(params[:id])
	end
	
	def update
		@recipe = Recipe.find(params[:id])
	end

	def destroy
		@recipe = Recipe.find(params[:id])
	end

	private 

		def recipe_params
			params.require(:recipe).permit(:name, :description)
		end

end