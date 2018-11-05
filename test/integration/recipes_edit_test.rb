require 'test_helper'

class RecipesEditTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
	#setup users and recipes
	def setup
		@chef = Chef.create!(chefname: "mash", email: "mash@foodcipes.com")
		@recipe = Recipe.create!(name: "Vegie Soup", description: "Sopa de vegetales", chef: @chef)
		@recipe2 = @chef.recipes.build(name: "Pollo al Carbon", description: "Pollo cocinado en carbon")
		@recipe2.save
	end

	test "should reject invalid recipe update" do 
		get edit_recipe_path(@recipe)
		assert_template 'recipes/edit'
		patch recipe_path(@recipe), params: {recipe: {name: " ", description: "some description "}}
		assert_template 'recipes/edit'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
	end

	test "should successfully edit a recipe" do 
		get edit_recipe_path(@recipe)
		assert_template 'recipes/edit'
		updated_name = "updated recipe name"
		updated_description = "updated recipe description"
		patch recipe_path(@recipe), params: {recipe: {name: "updated recipe name", description: "updated recipe description"}}
		#follow_redirect!
		assert_redirected_to @recipe
		assert_not flash.empty?
		@recipe.reload
		assert_match updated_name, @recipe.name
		assert_match updated_description, @recipe.description
	end
end
