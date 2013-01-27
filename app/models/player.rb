class Player
  include Mongoid::Document

  field :uuid, type: String
  field :username, type: String
  field :items, type: Array, default: []
  field :gender, type: String # male or female
  embeds_many :player_monsters
  field :last_location, :type => Array # Last player location
  field :last_location_time, type: DateTime, default: Time.now

  validates_presence_of :uuid, :username, :gender, :last_location
  validates_uniqueness_of :uuid, :username

  attr_accessible :uuid, :username, :items, :gender, :last_location, :last_location_time

end
