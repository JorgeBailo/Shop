class User < ActiveRecord::Base
  
  validates :email, presence: true, uniqueness: true
  validates_presence_of :name, :lastname, :password
  validates_length_of :name, :minimum => 3 , :maximum => 255
  validates_length_of :lastname, :minimum => 3 , :maximum => 255
  has_secure_password
end
