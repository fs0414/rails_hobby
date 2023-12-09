class Api::UsersController < BaseController
  def index
    users = User.all
    render json: { message: users }
  end

  def signup
    user = User.new(user_params)

    if user.save
      render json: { message: user }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def signin
    user = login(params[:email], params[:password])

    jwt_secret = ENV['JWT_SECRET']

    token = JWT.encode({ email: user.email }, jwt_secret)

    render json: { token: token, user: user }, status: :ok
    rescue => e
      render json: { error: e }, status: :unauthorized
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation, :role)
  end

  def form_authenticity_token; end
end
