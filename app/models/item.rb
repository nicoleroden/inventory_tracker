class Item < ActiveRecord::Base

validates :name,:presence => true
validates :purchased, :presence => true
validates :expiration,:presence => true
validates :location, :presence => true
validates :room_id, :presence => true


  belongs_to :room

end
