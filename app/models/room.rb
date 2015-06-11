class Room < ActiveRecord::Base

  validates :name, :presence =>true, :uniqueness => {:scope => :user_id, case_sensitive: false}

  has_many :items, dependent: :destroy
  belongs_to :user

end
