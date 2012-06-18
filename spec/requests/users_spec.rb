require 'spec_helper'

describe "Users" do
  describe "GET /users" do
    it "works!" do
      get new_user_session_path
      response.status.should be(200)
    end
  end
end
