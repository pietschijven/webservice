module Api
  
  class BalancesController < ApiController
    def index
      #respond_with Balance.all
      @balances = Balance.all
    end
    
    def show
      #respond_with Balance.find params[:id]
      @balance = Balance.find params[:id]
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
    
    private
    
    def balance_params
      params.require(:balance).permit(:time_period)
    end
  end
  
end
