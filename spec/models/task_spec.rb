require 'spec_helper'


describe Task do

	before(:each) do
		@list = mock_model(List)
		@list.should_receive(:id).and_return(1)
	  	@task = Task.new :name => "to test models", :list_id => @list.id
	end

	context "of new" do

		 it "should be saved" do
			@task.save.should be_true
  		end

		it "validate presence of :name" do
			@task.valid?.should be_true
			@task.name = nil
			@task.valid?.should be_false
		end
	end

	context "of relationship" do

		it "add some List" do
			@task.list=(@list)
			@task.list.should == @list
			@task.save.should be_true
		end

		it "validate assciated with List" do
			@task.list=(nil)
			@task.valid?.should be_false
		end
	end

end
