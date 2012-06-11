require 'spec_helper'

describe User do
	before(:each) do
		@user = User.new
	end
	context "of has many" do

		it "should have a list of List" do
			@user.lists.should eql([])
		end

		it "should hava a list of Watches" do
			@user.watches.should eql([])
		end
	end
end
