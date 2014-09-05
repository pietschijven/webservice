class BalancesController < ApplicationController
  before_action :set_balance, only: [:show, :edit, :update]
  def index
    @balance_checks = Balance.all
  end
  
  def show
    @balance_check = @balance.balance_check
  end
  
  def new
    @balance = Balance.new
  end
  
  def edit
  end
  
  def create
    @balance = Balance.new balance_params
    if @balance.create_balance
      redirect_to balances_path
    else
      flash[:warning] = "You have already created a balance for this particular month"
      redirect_to new_balance_path
    end
  end
  
  def update
    if @balance.update_balance balance_params
      redirect_to balances_path
    else
      render :edit
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
