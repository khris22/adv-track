class SessionsController < ApplicationController
    def home
    end

    def new
        @user = User.new
    end

    def create
        # if auth_hash = request.env["omniauth.auth"]
        #     oauth_username = request.env["omniauth.auth"]["extra"]["raw_info"]["login"]
        #     # request.env["omniauth.auth"]["info"]["email"]
        #     if @user = User.find_by(:username => oauth_username)
        #         binding.pry
        #         session[:user_id] = @user.id    
        #         redirect_to user_path(@user)
        #     # else
        #     #     @user = User.new(:email => oauth_email, :password => SecureRandom.hex, :username => oauth_email)
        #     #     if @user.save
        #     #         session[:user_id] = @user.id 
        #     #         redirect_to user_path(@user)
        #         else
        #             flash.now[:warning] = "Log In via Github was Unsuccessful. Please sign up"
        #             render 'new'
        #         # end
        #     end     
        # else
            @user = User.find_by(username: params[:user][:username])
            if @user && @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id 
                redirect_to user_path(@user)
            else 
                render 'new'
            # end
        end
    end

    def destroy
        session.clear
        # session.delete(:user_id)
        redirect_to root_path
    end

    private
    
    def auth
        request.env["omniauth.auth"]["extra"]["raw_info"]
    end
    
end
