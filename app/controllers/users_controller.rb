class UsersController < ApplicationController

    def login
    end

    def handle_login
        @user = User.find_by(username: params[:username])
    end

end
