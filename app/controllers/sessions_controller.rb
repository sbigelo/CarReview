class SessionsController < ApplicationController




    def create
        @user = User.find_by_username(params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to root_path
        else
            redirect_to login_path, flash: {error: "Username and/or password is incorrect."}
        end
    end

    

    def destroy
        session.clear
        redirect_to root_path
    end

    def omniauth
        @user = User.find_or_create_by(email: auth["info"]["email"]) do |user|
            user.username = auth["info"]["first_name"]
            user.password = SecureRandom.hex
        end
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to root_path
        end
    end

    private

    def auth
       request.env['omniauth.auth'] 
    end


end



   
