class Post < ActiveRecord::Base
  has_many :comments

  belongs_to :user
  belongs_to :topic

  default_scope { order('created_at DESC') }

  has_one :summary
  accepts_nested_attributes_for :summary
end
