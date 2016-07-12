describe "products/show" do 

  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = FactoryGirl.create(:user)
    sign_in @user
    @product = FactoryGirl.create(:product, user: @user)
  end

  it "display all the lineitems associated with product" do
    buyer1 = FactoryGirl.create(:guest, name: "Adam")
    buyer2 = FactoryGirl.create(:admin, name: "John")
    FactoryGirl.create(:line_item, user: buyer1, product: @product)
    FactoryGirl.create(:line_item, user: buyer2, product: @product)
    render
    expect(rendered).to match /Adam/
    expect(rendered).to match /John/
  end

end