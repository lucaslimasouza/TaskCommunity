require 'spec_helper'
include Warden::Test::Helpers


describe "Lists" do

  before(:each) do
	Warden.test_mode!
	@user = User.new(:email => 'example@mail.com', :password => '123456')
  end

  describe "POST /lists" do

	it "create List" do
		 login_as(@user, :scope => :user) do
			visit new_list_path
			fill_in('Name List', :with => 'Miniapp')
			choose('Public')
			fill_in('Name Task', :with => "nested attributes")
			click_button 'Submit'
			page.should have_content("List was successfully created")
			current_path.should == root_path
		end
	end
  end

  describe "GET /lists" do

	it "Lists of user" do
		login_as(@user, :scope => :user) do
			visit root_path
			click_link 'My Lists'
			current_path.should == lists_path
		end
	end
  end

  after(:all) do
	 Warden.test_reset!
  end


end
