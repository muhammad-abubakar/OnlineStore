describe "line_items/new" do 

  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  it "check all the field in a form" do
    @product = FactoryGirl.create(:product, user: @user)
    @line_item = @product.line_items.new

    render
    expect(response.body).to have_selector('form', text: "Quantity")
    expect(response.body).to have_selector('form', text: "Price")
  end

end