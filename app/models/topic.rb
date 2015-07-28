class Topic < ActiveRecord::Base
  has_many :posts

  validates :name, length: { minimum: 5 }
  validates :description, length: { minimum: 15 }
end
