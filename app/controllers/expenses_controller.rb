class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]

  def index
    @expenses = Expense.all     
  end

  def show
  end

  def new
    @expense = Expense.new
  end

  def edit
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.time_period = Date.parse expense_params[:time_period]
    if @expense.save
      redirect_to @expense, notice: 'Expense was successfully created'
    else
      render :new
    end
  end

  def update
    if @expense.update expense_params
      redirect_to @expense, notice: 'Expense was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @expense.destroy
    redirect_to expenses_url, notice: 'Expense was successfully destroyed'
  end

  private
  
  def set_expense
    @expense = Expense.find params[:id]
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def expense_params
    params.require(:expense).permit(:user_id, :cost, :paid_for_user_id, :time_period, :comment)  
  end

end
