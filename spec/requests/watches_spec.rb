require 'spec_helper'

describe "Watches" do

  before(:each) do
	Warden.test_mode!
	@user = User.new(:email => 'example@mail.com', :password => '123456')
  end

  describe "GET /watches" do

    it "watches of user" do
    	login_as(@user, :scope => :user) do
		visit root_path
		click_link 'My Watches'
		current_path.should == watches_path
	end
    end

  end

  after(:all) do
	 Warden.test_reset!
  end

end
