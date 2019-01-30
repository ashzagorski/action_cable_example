class Api::SessionsController < ApplicationController
  
  def new
    @user = User.new
  end 

  def create
    @user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      jwt = JWT.encode(
        {
          user_id: user.id, # the data to encode
          exp: 24.hours.from_now.to_i # the expiration time
        },
        Rails.application.credentials.fetch(:secret_key_base), # the secret key
        'HS256' # the encryption algorithm
      )
      render json: {jwt: jwt, email: user.email, user_id: user.id}, status: :created
    else
      render json: {}, status: :unauthorized
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end
end
