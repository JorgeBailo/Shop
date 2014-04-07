class Product < ActiveRecord::Base
  CATEGORIES = ['libros', 'hogar', 'juguetes', 'ropa', 'comestibles', 'música & películas', 'electrónica']
 
  scope :category_is, ->(category) { where category: category }
  scope :units_up, ->(units) { where('units > ?', units) }
  scope :price_down, ->(price) { where('price < ?', price) }
  scope :price_up, ->(price) { where('price > ?', price) }
  scope :registered_at_after, ->(date) { where(':registered_at > ?', date) }
  scope :manufacturer_like, ->(manufacturer) { where("manufacturer like ?", "#{manufacturer}%") }
  
  validates_presence_of :name, :description, :manufacturer, :units, :category, :price
  validates_length_of :name, :minimum => 3 , :maximum => 255
  validates_length_of :manufacturer, :minimum => 3 , :maximum => 255
  validates_numericality_of :units, :greater_than => 0
  validates_numericality_of :price, :greater_than => 0
  validates_uniqueness_of :name
  validates :category, inclusion: { in: CATEGORIES, message: "is not in #{CATEGORIES.join(', ')}" },  allow_blank: true
  
  has_many :item_lines
  has_many :orders, through: :item_lines
  
  def decrement_units(quantity)
    	self.units -= quantity
      update_column(:units, self.units)
  end
  
  private
  def timestamp_attributes_for_create
    super << :registered_at
  end
end
