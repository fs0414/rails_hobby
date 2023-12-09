class Api::SessionsController < BaseController
  def create

    user = login(params[:email], params[:password])
    # binding.pry
    if user
      # render json: { message: 'success' }
      render json: authorize(user)
    else
      render json: { error: 'Login failed' }, status: :unauthorized
    end
  end
end
