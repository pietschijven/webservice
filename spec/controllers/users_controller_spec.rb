require 'rails_helper'

describe UsersController, :type => :controller do
  let(:test_user) { FactoryGirl.create :user }
  
  describe 'GET #index' do  
    it 'provides a list of all the users' do
      get :index
      expect(assigns(:users)).to eq [test_user]
    end
    
    it 'renders the :index view' do
      get :index
      expect(response).to render_template :index
    end
  end
  
  describe 'GET #show' do
    it 'assigns the requested user to @user' do
      get :show, id: test_user
      expect( assigns(:user) ).to eq test_user
    end
    
    it 'renders the :show view' do
      get :show, id: test_user
      expect(response).to render_template :show
    end
  end
  
  describe 'GET #new' do
    it 'assignes a new instance of user to @user' do
      get :new
      user_class = assigns(:user).class
      expect( user_class).to eq User
    end
    it 'renders the :new view' do
      get :new
      expect(response).to render_template :new
    end
  end
  
  describe 'POST #create' do
    context 'with valid attributes' do
      let (:good_attribs) {FactoryGirl.attributes_for :user}
      it 'creates a new user' do
        expect{ 
          post :create, user:good_attribs
          }.to change(User,:count).by 1
      end
      it 'redirects to the new user' do
        post :create, user:good_attribs
        expect(response).to redirect_to User.last
      end
    end
    context 'with invalid attributes' do
      let(:bad_attribs) {FactoryGirl.attributes_for :invalid_user}
      it 'should not save a new user' do
        expect{post :create, user:bad_attribs}.to_not change(User,:count)
      end
      it 'should re-render the new template' do
        post :create, user:bad_attribs
        expect(response).to render_template :new
      end
    end
  end
  
  describe 'PUT update' do
    context 'valid attributes' do
      before(:each) do
        @test_user = FactoryGirl.create(:user, salary: 2.0)
        put :update, id: @test_user, user:FactoryGirl.attributes_for(:user)
      end
      it "located the requested @user" do
        assigns(:user).should eq @test_user
      end
      it "changes @test_user's attributes" do
        @test_user.reload
        @test_user.salary.should eq(1200)
      end
      it "redirects to the updated user" do
        expect(response).to redirect_to @test_user
      end
    end
    
    context 'invalid attributes' do
      before(:each) do
        @test_user = FactoryGirl.create(:user, salary:2.0)
        put :update, id: @test_user, user:FactoryGirl.attributes_for(:invalid_user)
      end
      it "located the requested @user" do
        assigns(:user).should eq @test_user
      end
      it "should not change @test_user's attributes" do
        @test_user.reload
        @test_user.salary.should_not eq 1200
      end
      it "should re-render the edit template" do
        expect(response).to render_template :edit
      end
    end
  end
  
  describe 'DELETE #destroy' do
    before(:each) do
      @test_user = FactoryGirl.create :user
    end
    it "deletes the user" do
      expect{delete :destroy, id: @test_user}.to change(User, :count).by -1
    end
    it "re-directs to #index" do
      delete :destroy, id: @test_user
      expect(response).to redirect_to users_path
    end
  end
end
