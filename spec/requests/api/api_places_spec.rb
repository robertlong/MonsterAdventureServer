require 'spec_helper'

describe "Api::Places" do
  describe "GET /api_places" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get "api/places", :place => { :latitude => 35.300139, :longitude => -120.665071, :radius => 1}
      puts response.body
      response.status.should be(200)
    end
  end
end
