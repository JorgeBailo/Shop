class Order < ActiveRecord::Base
  
  STATUS = ["Pending", "Send", "Received"] 
  PAYMENT_METHODS = ["Cash", "Card", "PayPal"]
  
  before_create :set_order_status
  
  has_many :item_lines, :dependent => :destroy  
  has_many :products, through: :item_lines
  accepts_nested_attributes_for :item_lines, :allow_destroy => true,
    :reject_if => lambda { |li| li[:product_id].blank? || li[:quantity].blank?}
    
  validates_presence_of :payment, :address, :city, :buyer_name, :buyer_lastname
  validates_length_of :city, :minimum => 3 , :maximum => 255
  validates_length_of :buyer_name, :minimum => 3 , :maximum => 255
  validates_length_of :buyer_lastname, :minimum => 3 , :maximum => 255
  validates :order_status, inclusion: { in: STATUS, message: "is not in #{STATUS.join(', ')}" },on: :update
  
  protected
  def set_order_status
    self.order_status = 'Pending'
  end
end
