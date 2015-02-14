module Api
  
  class ExpensesController < ApiController
    def index
      #respond_with Expense.all
      @expenses = Expense.all
    end
    
    def show
      #respond_with Expense.find params[:id]
      @expense = Expense.find params[:id]
    end
    
    def create
      respond_with Expense.create expense_params
    end
    
    def update
      respond_with Expense.update(params[:id], expense_params)
    end
    
    def destroy
      respond_with Expense.destroy params[:id]
    end
    
    private 
    
    def expense_params
      #change expense parameters to correct ids
      params[:expense][:user_id] = User.find_by_name(params[:expense][:user]).id
      params[:expense][:paid_for_user_id] = User.find_by_name(params[:expense][:paid_for_user]).id
      params.require(:expense).permit(:user_id, :cost, :paid_for_user_id, :time_period, :comment)
    end
  end
  
end
