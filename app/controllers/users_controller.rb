class UsersController < ApplicationController

    def login
        @user = User.find_by(username: params[:username])
    end

    def handle_login
        @user = User.find_by(username: params[:username])
    end

end
