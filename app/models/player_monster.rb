class PlayerMonster
  include Mongoid::Document

  embedded_in :player
  field :monster_id, type: String
  field :nickname, type: String
  field :level, type: Integer, default: 0
  field :experience, type: Integer, default: 0
  field :health, type: Integer
  field :caught_at, type: DateTime, default: Time.now
  field :caught_location, :type => Array # Caught location
  validates_presence_of :caught_location, :monster_id, :nickname

  attr_accessible :monster_id, :nickname, :level, :experience, :health, :caught_at, :caught_location

  def base_monster
    Monster.find(self.monster_id)
  end

  before_create do |pm|
    pm.health = Monster.find(self.monster_id).health
  end

end
