describe ProductsController, type: :controller do

  let(:user)  { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:admin) }
  let(:guest) { FactoryGirl.create(:guest) }
  describe "Admin" do
    before :each do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in admin 
    end

    let(:product) { FactoryGirl.create(:product) }

    it "lists all products" do
      get :index
      expect(response).to render_template("index")
    end

    it "create new Product" do
      expect{
        post :create, product: FactoryGirl.attributes_for(:product, user_id: admin.id)
        }.to change(Product, :count).by(1)
    end

    it "update any Product" do
      put :update, id: product, product: FactoryGirl.attributes_for(:product, quantity: 101)
      product.reload
      expect(product.quantity).to be(101)
    end

    it "delete any Product" do
      new_product = FactoryGirl.create(:product, user: user)
      expect { delete :destroy, id: new_product }.to change(Product, :count).by(-1)
    end
  end

  describe "User" do
    before :each do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in user 
    end

    it "lists all products" do
      get :index
      expect(response).to render_template("index")
    end

    it "create new Product" do
      expect{
        post :create, product: FactoryGirl.attributes_for(:product, user_id: user.id)
        }.to change(Product, :count).by(1)
    end

    it "update its own Product" do
      product = FactoryGirl.create(:product, user: user)
      put :update, id: product, product: FactoryGirl.attributes_for(:product, quantity: 101)
      product.reload
      expect(product.quantity).to be(101)
    end

    it "cannot update anyone else's product" do
      product = FactoryGirl.create(:product, user: FactoryGirl.create(:admin))
      put :update, id: product, product: FactoryGirl.attributes_for(:product, quantity: 101)
      expect(response.body).to match /redirected/ 
    end
  end

  describe "Guest" do
    it "lists all products" do
      get :index
      expect(response).to render_template("index")
    end

    it "cannot create new Product" do
      expect{
        post :create, product: FactoryGirl.attributes_for(:product, user_id: guest.id)
        }.to change(Product, :count).by(0)
    end

    it "cannot delete product" do
      new_product = FactoryGirl.create(:product, user: user)
      expect { delete :destroy, id: new_product }.to change(Product, :count).by(0)
    end
  end
end
