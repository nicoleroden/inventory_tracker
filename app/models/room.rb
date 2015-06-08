class Room < ActiveRecord::Base

  validates :name, :presence =>true, :uniqueness => {:scope => :user_id}

  has_many :items
  belongs_to :user

end
