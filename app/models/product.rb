class Product < ActiveRecord::Base
  belongs_to :user
  has_many :line_items, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :user
  validates_numericality_of :unit_price, allow_nil: true, greater_than_or_equal_to: 0
  validates_numericality_of :quantity,  :greater_than_or_equal_to => 0

end
