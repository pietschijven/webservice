class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]
  before_filter :restrict_access, :if => lambda{ |controller| controller.request.format.json? } 

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

    respond_to do |format|
      if @expense.save
        format.html { redirect_to @expense, notice: 'Expense was successfully created.' }
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { render :new }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to @expense, notice: 'Expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense }
      else
        format.html { render :edit }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to expenses_url, notice: 'Expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  
  def set_expense
    @expense = Expense.find(params[:id])
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def expense_params
    p = params[:expense]
    if p[:paid_for_user_id].blank? or ( p[:user_id] == p[:paid_for_user_id] )
      params[:expense][:paid_for_user_id] = nil
      flash[:warning] = "User cannot pay for itself. Paid for user has been set to nil"
    end
    params.require(:expense).permit(:user_id, :cost, :common, :paid_for_user_id, :time_period)  
  end
    
  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      ApiKey.exists?(access_token: token)
    end
  end
end
