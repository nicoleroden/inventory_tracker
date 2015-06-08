class Room < ActiveRecord::Base

  validates :user_id, :presence => true, :uniqueness => true
  validates :name, :presence =>true, :uniqueness => true

  has_many :items
  belongs_to :user

end
