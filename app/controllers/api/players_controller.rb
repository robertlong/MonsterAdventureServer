class Api::PlayersController < ApplicationController

  protect_from_forgery :except => [:show,:create,:update]

  # GET /api/players/:uuid.json
  # Return player/player
  def show
    @player = Player.where(:uuid => params[:uuid]).first
    if @player
      render :json => { :success => true, :player => @player }
    else
      render :json => { :success => false, :player => {} } , :status => 404
    end

  end

  # POST /api/players.json
  # POST Params
  # - uuid
  # - username

  def create
    json = ActiveSupport::JSON.decode(params[:player])
    @player = Player.new
    @player.gender = json["gender"]
    @player.username = json["username"]
    @player.uuid = json["uuid"]
    @player.last_location = json["location"]
    @player.player_monsters = [ PlayerMonster.new({   :nickname => json["starting_monster"]["nickname"],
                                                      :monster_id => json["starting_monster"]["id"],
                                                      :caught_location => json["location"]
                                                 }) ]
    if @player.save
      render :json => { :success => true, :player => @player } , :status => 200
    else
      render :json => { :success => false, :message => @player.errors } , :status => 400
    end
  end

  # PUT /api/players/1.json
  # {
  #   player: {
  #     user_monsters: {}
  #   },
  #   location: {
  #
  #   }
  #
  # }
  def update
    @player = Player.where(:uuid => params[:uuid]).first

    if @player.update_attributes(params[:player])
      render :json => { :success => true, :player => @player } , :status => 200
    else
      render :json => { :success => false, :message => @player.errors } , :status => 400
    end
  end

end
