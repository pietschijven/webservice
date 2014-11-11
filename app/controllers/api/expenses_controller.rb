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
      params.require(:expense).permit(:user_id, :cost, :paid_for_user_id, :time_period)
    end
  end
  
end
