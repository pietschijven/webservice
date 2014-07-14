require 'rails_helper'

describe ExpensesController do
  let(:test_expense) { FactoryGirl.create :expense }
  
  describe 'GET #index' do  
    it 'provides a list of all the expenses' do
      #expense = FactoryGirl.create(:expense)
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
end
