module Api
  
  class BalancesController < ApiController
    def index
      #respond_with Balance.all
      @balances = Balance.all
      params_redirect unless params[:time_period].nil?
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
    
    def params_redirect
      period_param = Date.parse(params[:time_period]).beginning_of_month
      balance = Balance.find_by_time_period period_param
      
      redirect_to api_balance_path balance unless balance.nil?
    end
  end
  
end
