require 'test_helper'

class RecipesTest < ActionDispatch::IntegrationTest
	#setup users and recipes
	def setup
		@chef = Chef.create!(chefname: "mash", email: "mash@foodcipes.com")
		@recipe = Recipe.create!(name: "Vegie Soup", description: "Sopa de vegetales", chef: @chef)
		@recipe2 = @chef.recipes.build(name: "Pollo al Carbon", description: "Pollo cocinado en carbon")
		@recipe2.save
	end
  # test "the truth" do
  test "should get recipes index" do 
  	get recipes_path
  	#   assert true
  	assert_response :success
  end

  test "should get recipes listing" do 
  	get recipes_path
  	#   assert true
  	assert_template 'recipes/index'
  	assert_match @recipe.name, response.body
  	assert_match @recipe2.name, response.body
  end


end
