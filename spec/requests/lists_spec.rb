require 'spec_helper'
include Warden::Test::Helpers


describe "Lists" do

  describe "POST /lists" do

	before(:each) do
		Warden.test_mode!
		@user = User.new(:email => 'lucaslima4p@gmail.com', :password => '123456')
		login_as @user, :scope => :user
	end

	#only to test if I can login here
	it "sign_in" do
		visit user_session_path
		fill_in 'Email', :with => @user.email
		fill_in 'Password', :with => @user.password
		click_button 'Sign in'
		save_and_open_page
	end

	it "create List" do
		visit new_list_path
		fill_in('Name List', :with => 'Miniapp')
	        choose('Public')
	        fill_in('Name Task', :with => "nested attributes")
	        click_button 'Submit'
	        page.should have_content("List was successfully created")
		save_and_open_page
	end

	after(:each) do
	  Warden.test_reset!
	end

  end

	def sign_in

	end

end
