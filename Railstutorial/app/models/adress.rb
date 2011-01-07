class Adress < ActiveRecord::Base
 attr_accessible :adress
  
 belongs_to :user
  
  validates :adress,  :presence => true, :length => { :maximum => 40 }
  validates :user_id, :presence => true
end
