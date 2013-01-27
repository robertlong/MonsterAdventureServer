class Place
  include Mongoid::Document

  field :name, type: String
  field :coordinates, :type => Array
  field :radius, type: Integer #feet
  field :items, type: Array, default: []
  field :monsters, type: Array, default: []

end
