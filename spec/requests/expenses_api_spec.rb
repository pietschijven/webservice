require 'rails_helper'

describe "Expenses API" do
  #Create a test user for each expense
  before(:each) do
    @test_user = FactoryGirl.create(:user)
  end
  
  describe "GET requests" do
    before(:each) do
      @test_expense = FactoryGirl.create(:expense)
    end

    describe "#index" do  
      it "should return the list of all expenses" do
        get api_expenses_path
      
        body = JSON.parse response.body
        expect(body.first["user"]).to eq @test_user.name
        expect(body.first["cost"]).to eq @test_expense.cost
      end
    end
    
    describe "#show" do
      it "should return the correct expense" do
        get api_expense_path @test_expense
        body = JSON.parse response.body
        expect(body["user"]).to eq @test_user.name
        expect(body["cost"]).to eq @test_expense.cost
      end
    end
  end
  
  describe "POST, PUT and DELETE" do
    let(:json_params) do
      { :expense => FactoryGirl.attributes_for(:expense)}.to_json
    end
    
    let(:request_headers) do
      { "Content-Type" => "application/json" }
    end
    
    describe "#create" do
      it "should create a new expense" do
        post api_expenses_path, json_params, request_headers
        new_expense = Expense.first
        expect(new_expense.user.name).to eq @test_user.name
        expect(new_expense.cost).to eq 2.45
      end
    end
  
    describe "#update" do
      it "should update the correct expense" do
        expense = FactoryGirl.create(:expense, :cost => 2.0)
        put api_expense_path(expense.id), json_params, request_headers
        expense.reload
        expect(expense.cost).to eq 2.45
      end
    end
  
    describe "#destroy" do
      it "should delete the expense" do
        expense = FactoryGirl.create(:expense)
        expect{delete api_expense_path(expense.id), {}, request_headers}.to change(Expense, :count).by -1
      end
    end
  end
end
