class Order < ActiveRecord::Base
  
  has_many :item_lines, :dependent => :destroy  
  has_many :products, through: :item_lines
  accepts_nested_attributes_for :item_lines, :allow_destroy => true,
    	:reject_if => lambda { |li| li[:product_id].blank? || li[:quantity].blank? || li[:price].blank? }
    
  validates_presence_of :order_status, :payment, :address, :city, :buyer_name, :buyer_lastname
  validates_length_of :order_status, :minimum => 3 , :maximum => 255
  validates_length_of :payment, :minimum => 3 , :maximum => 255
  validates_length_of :payment, :minimum => 3 , :maximum => 255
  validates_length_of :city, :minimum => 3 , :maximum => 255
  validates_length_of :buyer_name, :minimum => 3 , :maximum => 255
  validates_length_of :buyer_lastname, :minimum => 3 , :maximum => 255
end
