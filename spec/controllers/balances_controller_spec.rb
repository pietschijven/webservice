require 'rails_helper'

describe BalancesController, :type => :controller do
  let(:balance_check_test) { FactoryGirl.create :balance }
  
  describe 'GET #index' do  
    it 'provides a list of all the monthly balances' do
      get :index
      expect(assigns(:balance_checks)).to eq [balance_check_test]
    end
    
    it 'renders the :index view' do
      get :index
      expect(response).to render_template :index
    end
  end
  
  describe 'GET #show' do
    it 'assigns the requested balance to @balance' do
      get :show, id: balance_check_test
      expect( assigns(:balance) ).to eq balance_check_test
    end
    
    it 'renders the :show view' do
      get :show, id: balance_check_test
      expect(response).to render_template :show
    end
  end
  
  describe 'GET #new' do
    it 'renders the :new view' do
      get :new
      expect(response).to render_template :new
    end
    
    it 'assigns a new balance to @balance' do
      get :new
      expect( assigns(:balance).class ).to eq Balance
    end
  end
  
  describe "POST #create" do
    context 'with valid attributes' do
      let(:good_attribs) {FactoryGirl.attributes_for :balance}
      it 'saves the new balance in the database' do
        expect{ post :create, balance:good_attribs}.to change(Balance, :count).by 1
      end
      
      it 'redirects to balance#index' do
        post :create, balance:good_attribs
        expect(response).to redirect_to balances_path
      end
      
      it 'calls Balance#create_balance(date)' do
        post :create, balance:good_attribs
        expect(assigns(:balance)).to receive(:create_balance).with(no_args)
      end
    end
    
    context 'with invalid attributes' do
      before(:each) do
        FactoryGirl.create(:balance)
      end
      
      let(:bad_attribs){ FactoryGirl.attributes_for :balance }
      
      it 'does not save the new balance in the database' do
        expect{ post :create, balance:bad_attribs}.to change(Balance, :count).by 0
      end
      
      it 're-renders the new template with a warning' do
        post :create, balance:bad_attribs
        expect(response).to render_template :new
      end
    end
  end
end
