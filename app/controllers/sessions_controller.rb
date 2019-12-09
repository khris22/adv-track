class SessionsController < ApplicationController
    def home
    end

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(username: params[:user][:username])
            if @user && @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id 
                redirect_to adventures_path
            else
                flash[:error] = "Sorry, your username or password did not match"
                render 'new'
        end
    end

    def ghcreate
        # binding.pry
       if @user = User.find_or_create_by(auth_id: auth['uid']) do |u|
                u.username = auth['info']['name']
                u.email = auth['info']['email']
                u.password = SecureRandom.hex #auth['uid']
            end
            session[:user_id] = @user.id 
            redirect_to adventures_path
        else
            flash[:error] = "Log In via Github was Unsuccessful. Please sign up"
            render 'new'
        end
    end

    def destroy
        session.clear
        # session.delete(:user_id)
        redirect_to root_path
    end
    
    private

    def auth
      request.env['omniauth.auth']
    end
    
end
