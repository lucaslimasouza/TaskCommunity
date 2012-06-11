require 'spec_helper'

describe List do

	before(:each) do
		@user_mock = mock_model(User)
		#@user_mock.should_receive(:id).and_return(1)
		@list = List.new :name => "Mini-app TaskCommunity", :status => "public", :user_id => @user_mock.id
	end

	context "of new" do

		it "should be saved" do
			@list.save.should be_true
		end

		it "validate presence of name" do
			@list.valid?.should be_true
			@list.name = nil
			@list.valid?.should be_false
		end

		it "validate presence of status" do
			@list.status = nil
			@list.valid?.should be_false
		end

		it "validate presence of User" do
			@list.user_id = nil
			@list.valid?.should be_false
		end

	end

	context "relationship with Task" do

		it "should add some" do
			@task = mock_model(Task)
			@tasks_mock = Array.new
			@tasks_mock<<@task
			@list.tasks @tasks_mock
			@list.tasks[1] ==@task
			@list.save.should be_true
		end
	end

	context "finder" do
		before do
	              List.new(:name => "Fix car", :status => "private").save
		end

		it "should list only private List" do
			@lists_private = List.private
			@lists_private.each {|list| list.status.should eql("private")}
		end

		it "should list only public List" do
			@lists_public = List.public
			@lists_public.each {|list| list.status.should eql("public")}
		end
	end

	context "relationship with User" do

		it "add some" do
			@list.user=(@user_mock)
			@list.save.should be_true
		end

		it "validate associated " do
			@list.user=(nil)
			@list.valid?.should be_false
		end

	end
end
