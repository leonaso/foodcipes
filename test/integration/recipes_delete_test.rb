require 'test_helper'

class RecipesDeleteTest < ActionDispatch::IntegrationTest

	#setup users and recipes
	def setup
		@chef = Chef.create!(chefname: "mash", email: "mash@foodcipes.com")
		@recipe = Recipe.create!(name: "Vegie Soup", description: "Sopa de vegetales", chef: @chef)
		@recipe2 = @chef.recipes.build(name: "Pollo al Carbon", description: "Pollo cocinado en carbon")
		@recipe2.save
	end

  # test "the truth" do
  test "should successfully delete recipe" do 
  	get recipe_path(@recipe)
  #   assert true
  	assert_template 'recipes/show'
  	assert_select 'a[href=?]', recipe_path(@recipe), text: "Delete this recipe"
  	assert_difference 'Recipe.count', -1 do
  		delete recipe_path(@recipe)
  	end
  	assert_redirected_to recipes_path
  	assert_not flash.empty?
	# end
	end

  
end
