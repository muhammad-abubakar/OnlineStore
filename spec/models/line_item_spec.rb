
describe LineItem do
  before :all do
    @seller  = FactoryGirl.create(:user, email: 'seller@seller.com')
    @product = FactoryGirl.create(:product, user: @seller, quantity: 20)
    @buyer  = FactoryGirl.create(:user, email: 'buyer@buyer.com')
  end
  
  it ".has a valid factory" do
    expect(FactoryGirl.create(:line_item, product: @product, user: @buyer)).to be_valid
  end

  it "Purchased quantity more than available" do
    line_item = FactoryGirl.build(:line_item, quantity: 30, product: @product, user: @buyer)
    line_item.valid?
    expect(line_item.errors[:quantity]).to include(I18n.t('errors.quantity_availability_error'))
  end
end