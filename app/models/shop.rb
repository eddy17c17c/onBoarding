class Shop
  include Mongoid::Document
  include Mongoid::Timestamps
  field :shop_name, type: String

  belongs_to :user #1-1 relationship
end
