
describe Product do
  it ".has a valid factory" do
    expect(FactoryGirl.create(:product)).to be_valid
  end

  it ".is invalid without name" do 
    expect(FactoryGirl.build(:product, name: nil)).to be_invalid
  end
end