class Product < ActiveRecord::Base
  
  private
  def timestamp_attributes_for_create
    super << :registered_at
  end
  
  validates_presence_of :name, :description, :manufacturer, :units
  validates_length_of :name, :minimum => 3 , :maximum => 255
  validates_length_of :manufacturer, :minimum => 3 , :maximum => 255
  validates_numericality_of :units, :greater_than => 0
end