class BalancesController < ApplicationController
  before_action :set_balance, only: [:show]
  def index
    @balance_checks = Balance.all
  end
  
  def show
  end
  
  def new
    @balance = Balance.new
  end
  
  def create
    @balance = Balance.new balance_params
    if @balance.create_balance
      redirect_to balances_path
    else
      redirect_to @balance
    end
  end
  
  private
  
  def set_balance
    @balance = Balance.find params[:id]
  end
  
  def balance_params
    params.require(:balance).permit(:time_period)
  end
end
