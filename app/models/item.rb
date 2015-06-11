class Item < ActiveRecord::Base

validates :name,:presence => true
validates :purchased, :presence => true
validates :expiration,:presence => true
validates :room_id, :presence => true


  belongs_to :room
  belongs_to :user

end
