class Attack
  include Mongoid::Document
  field :name, type: String
  field :effectiveness, type: Hash
end
