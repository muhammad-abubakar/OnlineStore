class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates_associated :product,:user
  validate :price_greater_than_zero
  validate :prachase_quantity

  after_save :update_available_quantity

  protected

  def update_available_quantity
    product.quantity =  product.quantity - quantity
    product.save
  end

  def is_valid_quantity?
    (quantity > 0 && product.quantity >= quantity)
  end

  def prachase_quantity
    errors.add(:quantity, I18n.t('errors.quantity_availability_error')) unless is_valid_quantity? 
  end

  def price_greater_than_zero
    price > 0
  end
end
