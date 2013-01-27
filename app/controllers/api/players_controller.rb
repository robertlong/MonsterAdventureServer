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
    puts params.as_json
    @player = Player.new(params[:player])
    puts "yup"
    @player.last_location = params[:player][:location]
    puts "fuck"
    @player.player_monsters.build({
                                      :nickname => params[:player][:starting_monster][:nickname],
                                      :monster_id => params[:player][:starting_monster][:id],
                                      :caught_location => params[:player][:location]
                                  })
    puts "cunt"

    if @player.save
      render :json => { :success => true, :player => @player } , :status => 300
    else
      render :json => { :success => false, :message => @player.errors } , :status => 400
    end
    puts "fuckin fuck fuck fuck fikity fuck"
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
      render :json => { :success => true, :player => @player }
    else
      render :json => { :success => false, :message => @player.errors } , :status => 400
    end
  end

end
