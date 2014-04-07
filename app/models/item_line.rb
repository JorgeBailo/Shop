class ItemLine < ActiveRecord::Base
  before_validation :set_price
  after_create :decrement_quantity
  
  belongs_to :order
  belongs_to :product
  
  validates_presence_of :product_id, :quantity
  validates_numericality_of :quantity, :greater_than => 0
  
  private
    def set_price
      self.price = product.price
    end

    def decrement_quantity
      self.product.decrement_units self.quantity
    end
end
