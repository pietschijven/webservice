module Api
  
  class BalancesController < ApplicationController
    respond_to :json
    
    def index
      respond_with Balance.all
    end
    
    def show
      respond_with Balance.find params[:id]
    end
    
    def create
      @balance = Balance.new params[:balance]
      respond_with @balance.create_balance
    end
    
    def update
      @balance = Balance.find params[:id]
      respond_with @balance.update_balance params[:balance]
    end
    
    def destroy
      respond_with Balance.destroy params[:id]
    end
  end
  
end
