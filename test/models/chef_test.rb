require 'test_helper'

class ChefTest < ActiveSupport::TestCase

	def setup
		@chef = Chef.new(chefname: "Tom", email: "tom@foodcipes.com")
	end

	test "should be valid" do 
		assert @chef.valid?
	end

	test "name should be present" do
		@chef.chefname = ""
		assert_not @chef.valid?
	end

	test "name should be less than 30 chars" do
		@chef.chefname = "a" *31
		assert_not @chef.valid?
	end
	
	test "email should be present"	do 
		@chef.email = ""
		assert_not @chef.valid?
	end
	
	test "email should be to long" do 
		@chef.email = "abc" * 100
		assert_not @chef.valid?
	end
		
	test "email should accept correct format" do 
		valid_emails = %w[user@example.com Mash@gmail.com M.first@yahoo.ca john+smith@co.uk.org]
		valid_emails.each do |valids|
			@chef.email = valids
			assert @chef.valid?, "#{valids.inspect} should be valid"
		end	
	end	

		test "should reject invalid addresses" do
			invalid_emails = %w[mash@example mas@example,com mash.name@gmail. joe+baat@co.]
			invalid_emails.each do |invalids|
				@chef.email = invalids 
				assert_not @chef.valid? "#{invalids.inspect} should be invalid"
			end	
		end

		test "email should be unique and case insensitive" do 
			duplicate_chef = @chef.dup 
			duplicate_chef.email = @chef.email.upcase
			@chef.save
			assert_not duplicate_chef.valid?
		end	

		test "email should be lower case before hitting db"	do 
			mixed_email = "joHN@Example.com"
			@chef.email = mixed_email
			@chef.save
			assert_equal mixed_email.downcase, @chef.reload.email			
		end
		
end
