require 'spec_helper'


describe Task do

	before(:each) do
		@task = Task.new
	end

	context "of new" do

		 it "should be saved" do
			@task.name= "to test the models"
			@task.save.should be_true
  		end

		it "validate presence of :name" do
			@task.valid?.should be_false
		end
	end


end
