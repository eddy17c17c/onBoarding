class User
  include Mongoid::Document
  include Mongoid::Timestamps
  field :first_name, type: String
  validates_presence_of :first_name

  field :last_name, type: String
  validates_presence_of :last_name

  field :age, type: Integer
  validates_numericality_of :age, greater_than: 0

  field :gender, type: String
  validates_inclusion_of :gender, in: ['male', 'female', 'others']
  #search mongoid validation in google

  has_one :shop #1-1 relationship

  def create_shop (name)
    Shop.create(user: self, shop_name: name)
  end
end
