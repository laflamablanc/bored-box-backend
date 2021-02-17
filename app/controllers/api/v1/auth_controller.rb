class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]
   
    def create
        # byebug
        current_user = User.find_by(username: user_login_params[:username])
 
        if current_user && current_user.authenticate(user_login_params[:password])
            token = encode_token({ user_id: current_user.id })
            render json: { user: UserSerializer.new(current_user), jwt: token}, status: :accepted
        else
            render json: { message: 'Invalid username or password' }, status: :unauthorized
        end
    end
   
    private
   
    def user_login_params
      # params { user: {username: 'Chandler Bing', password: 'hi' } }
      params.require(:user).permit(:username, :password)
    end
  end
