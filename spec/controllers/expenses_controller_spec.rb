require 'rails_helper'

describe ExpensesController, :type => :controller do
  let(:test_expense) { FactoryGirl.create :expense }
  
  describe 'GET #index' do  
    it 'provides a list of all the expenses' do
      get :index
      expect(assigns(:expenses)).to eq [test_expense]
    end
    
    it 'renders the :index view' do
      get :index
      expect(response).to render_template :index
    end
  end
  
  describe 'GET #show' do
    it 'assigns the requested expense to @expense' do
      get :show, id: test_expense
      expect( assigns(:expense) ).to eq test_expense
    end
    
    it 'renders the :show view' do
      get :show, id: test_expense
      expect(response).to render_template :show
    end
  end
  
  describe 'GET #new' do
    it 'assignes a new instance of Expense to @expense' do
      get :new
      expense_class = assigns(:expense).class
      expect( expense_class).to eq Expense
    end
    it 'renders the :new view' do
      get :new
      expect(response).to render_template :new
    end
  end
  
  describe 'POST #create' do
    context 'with valid attributes' do
      let (:good_attribs) {FactoryGirl.attributes_for :expense}
      it 'creates a new expense' do
        expect{ 
          post :create, expense:good_attribs
          }.to change(Expense,:count).by 1
      end
      it 'redirects to the new expense' do
        post :create, expense:good_attribs
        expect(response).to redirect_to Expense.last
      end
    end
    context 'with invalid attributes' do
      let(:bad_attribs) {FactoryGirl.attributes_for :invalid_expense}
      it 'should not save a new expense' do
        expect{post :create, expense:bad_attribs}.to_not change(Expense,:count)
      end
      it 'should re-render the new template' do
        post :create, expense:bad_attribs
        expect(response).to render_template :new
      end
    end
  end
end
