require 'test_helper'

class Recipetest < ActiveSupport::TestCase

	def setup
		@recipe = Recipe.new(name: "vegestable", description: "great vegetable recipe")
	end

	test "recipe should be valid" do 
		assert @recipe.valid?		
	end

	test "name should be present" do
		@recipe.name	= " "
		assert_not @recipe.valid?
	end

	test "description should be present" do
		@recipe.description	= " "
		assert_not @recipe.valid?
	end

	test "description should not be less than 5 chars" do
		@recipe.description	= "a" * 2
		assert_not @recipe.valid?
	end

	test "description should not be more than 500 chars" do
		@recipe.description	= "a" * 501 
		assert_not @recipe.valid?
	end

end