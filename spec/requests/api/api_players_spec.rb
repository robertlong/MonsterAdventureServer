require 'spec_helper'

describe "Api::Players" do
  describe "POST /api_players" do
    it "creates a new user" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      post "api/players", :player => { :uuid => "test4", :username => "test user4", :gender => "male",
                                          :starting_monster => { :id => "510485f13a812433ed312c17", :nickname => "Testmon"},
                                          :location => [0.0,0.0]
                                      }
      puts response.body
      response.status.should be(300)
    end
  end
end
