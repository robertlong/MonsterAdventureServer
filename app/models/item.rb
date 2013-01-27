class Item
  include Mongoid::Document
  field :name, type: String
  field :stat, type: String
  field :modifier, type: Hash # { :add => -1.0, :multiply => 1.2}
end
