feature "Signing in" do
  background do
    @user = FactoryGirl.create(:user)
  end

  scenario "Signing in with correct credentials" do
    visit '/users/sign_in'
    within("#new_user") do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
    end
    click_button 'Log in'
    expect(page).to have_content 'successfully'
  end
end