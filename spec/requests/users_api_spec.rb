require 'rails_helper'

describe "Users API" do
  describe "GET #index" do
    it "should return the correct list of all users" do
      FactoryGirl.create(:user, name: "Pietjepuk", salary: 100)
      FactoryGirl.create(:user, name: "Bladiebla", salary: 200)
      
      get api_users_path
      
      body = JSON.parse(response.body)
      user_names = body.map {|b| b["name"]}
      salaries = body.map {|b| b["salary"]}
      
      expect(user_names).to match_array(["Pietjepuk", "Bladiebla"])
      expect(salaries).to match_array([100, 200])
    end
    
    it "should return status code 200" do
      get api_users_path
      expect(response.status).to eq 200
    end
  end
  
  describe "GET #show" do
    it "should return the correct user" do
      user = FactoryGirl.create :user
      get api_user_path user.id
      body = JSON.parse response.body
      expect(body["name"]).to eq "Hans"
      expect(body["salary"]).to eq 1200.0
    end
  end
  
  describe "POST #create" do
    it "should create a new user" do
      json_parameters = {:user => FactoryGirl.attributes_for(:user)}.to_json
      
      request_headers = {
        "Content-Type" => "application/json"
      }
      
      post api_users_path, json_parameters, request_headers
      
      expect(response.status).to eq 201
      new_user = User.first
      expect(new_user.name).to eq "Hans"
      expect(new_user.salary).to eq 1200.0
    end
  end
  
  describe "PUT #update" do
    it "should update an existing user" do 
      user = FactoryGirl.create(:user, name: "rotjeknor")
      json_parameters = {:user => FactoryGirl.attributes_for(:user)}.to_json
      
      request_headers = {
        "Content-Type" => "application/json"
      }
      
      put api_user_path(user.id), json_parameters, request_headers
      
      expect(response.status).to eq 204
      user.reload
      expect(user.name).to eq "Hans"
    end
  end
  
  describe "DELETE #destroy" do
    it "should delete a user" do
      user = FactoryGirl.create :user
      request_headers = {
        "Content-Type" => "application/json"
      }
      expect{delete api_user_path(user.id), {}, request_headers}.to change(User, :count).by -1
    end
  end
end
