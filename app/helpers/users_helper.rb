module UsersHelper

    def error
        flash[:error] if flash[:error]
    end

end
