module Api

  class UsersController < ApiController
    def index
      #respond_with User.all
      @users = User.all
    end
    
    def show
      #respond_with User.find params[:id]
      @user = User.find params[:id]
    end
    
    def create
      respond_with User.create user_params
    end
    
    def update
      respond_with User.update(params[:id], user_params)
    end
    
    def destroy
      respond_with User.destroy params[:id]
    end
    
    private 
    
    def user_params
      params.require(:user).permit(:name, :salary)
    end
    
  end
end
