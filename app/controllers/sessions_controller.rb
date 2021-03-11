class SessionsController < ApplicationController

    def home

    end

    def destroy
        session.destroy
        redirect_to root_path
    end


end