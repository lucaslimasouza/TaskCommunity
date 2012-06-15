require 'spec_helper'

describe List do

	before do
		@user_mock = mock_model(User)
		@list = new_list
	end

	context "of new" do
		before do
		  @list = List.new
		end

		it "should be saved" do
			@list = new_list
			@list.valid?should be_true
			@list.save.should be_true
		end

		it "validate presence of name" do
			@list.status="public"
			@list.user_id=@user_mock.id
			@list.valid?.should be_false
		end

		it "validate presence of status" do
			@list.name="Mini-app TaskCommunity"
			@list.user_id=@user_mock.id
			@list.valid?.should be_false
		end

		it "validate presence of User" do
			@list.name="Mini-app TaskCommunity"
			@list.status="public"
			@list.valid?.should be_false
		end

	end

	context "relationship with Task" do

		it "should add some" do
		params = {:list =>{:name => "Miniapp",
					:tasks_attributes => [
						{:name => "nested attributes"},
						{:name => "public lists"} ]}}
		@list.save(params[:list]).should be_true
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

	private

	def new_list
		List.new :name => "Mini-app TaskCommunity", :status => "public", :user_id => @user_mock.id
	end
end
