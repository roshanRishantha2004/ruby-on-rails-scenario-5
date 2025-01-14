class Api::V1::AuthController < ApplicationController
    skip_before_action :authorize_request, only: :login

    def login
      user = User.find_by(username: params[:username])
  
      if user&.authenticate(params[:password])
        token = JsonWebToken.encode(user_id: user.id)
        render json: { token: token }, status: :ok
      else
        render json: { error: 'Invalid credentials' }, status: :unauthorized
      end
    end
end
