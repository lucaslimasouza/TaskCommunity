require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the ListsHelper. For example:
#
# describe ListsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe ListsHelper do
	describe "add link" do
		it "add a task link" do
			@form = double(ActionView::Helpers::FormBuilder)
			helper.add_task_link(@form).should eql("")
		end
	end
end