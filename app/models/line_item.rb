class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates_associated :products
  validate :price_greater_than_zero
  validate :prachase_quantity

  after_save :update_available_quantity

  protected

  def update_available_quantity
    product.quantity =  product.quantity - quantity
    product.save
  end

  def is_valid_quantity?
    (quantity > 0 && products.quantity > quantity)
  end

  def prachase_quantity
    errors.add(:quantity,"Quantity not valid") unless is_valid_quantity? 
  end

  def price_greater_than_zero
    price > 0
  end
end
