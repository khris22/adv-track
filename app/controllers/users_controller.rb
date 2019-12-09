class UsersController < ApplicationController
    before_action :authenticate_user
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id 
            redirect_to adventures_path
        else
            render 'new'
            #div class="field_with_errors" will only happen in render
        end
    end

    def show
        @user = User.find_by(id: params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

end
