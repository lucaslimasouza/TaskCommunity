require 'spec_helper'

describe Watch do

	before(:each) do
		@user_mock = user_mock
		@list_mock = list_mock
	end

	context "associations " do

		before(:each) do
		  	@watch = Watch.new
		end

		it "validate presence of List" do
			 @watch.user_id= @user_mock.id
			@watch.valid?.should be_false

		end

		it "validate presence of User" do
			@watch.list_id= @list_mock.id
			@watch.valid?.should be_false
		end

		it "should be saved" do
			@watch.list_id= @list_mock.id
			@watch.user_id= @user_mock.id
			@watch.save.should be_true
		end

	end

	private

	def user_mock
		@user_mock = mock_model(User)
		#@user_mock.should_receive(:id).and_return(1)
		@user_mock
	end

	def list_mock
		@list_mock = mock_model(List)
		#@list_mock.should_receive(:id).and_return(1)
		@list_mock
	end
end
