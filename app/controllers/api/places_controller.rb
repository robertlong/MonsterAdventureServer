class Api::PlacesController < ApplicationController

  protect_from_forgery :except => [:show]

  # GET /api/places/1.json
  # GET Params
  #   - player_id : the UUID of the player
  #   - latitude : the latitude coordinate of the player
  #   - longitude : the longitude coordinate of the player

  def show
    @place = Place.all
    @place.each do |p|
      p.id
    end
    render :json => @place, :status => 200
  end

end
