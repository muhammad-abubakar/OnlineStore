feature "Purchase" do
  background do
    @user = FactoryGirl.create(:user)
    login_as(@user, scope: :user)
    @product = FactoryGirl.create(:product, user: @user)
  end

  scenario "Sell Item" do
    visit new_product_line_item_path(@product)
    within("#new_line_item") do
      fill_in 'Quantity', with: 3
      fill_in 'Price', with: 20
    end
    click_button 'Create Line item'
    expect(page).to have_content 'successfully created'
  end
end