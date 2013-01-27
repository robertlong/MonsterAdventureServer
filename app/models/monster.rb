class Monster
  include Mongoid::Document
  #field :_id, type: Integer
  field :name, type: String
  field :type, type: String
  field :attack, type: Integer
  field :defense, type: Integer
  field :speed, type: Integer
  field :health, type: Integer
  field :attacks, type: Array
end
