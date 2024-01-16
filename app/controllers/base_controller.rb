class BaseController < ApplicationController
  include Sorcery::Controller

  rescue_from ActiveRecord::RecordNotFound do
    head :not_found
  end

  rescue_from ActiveRecord::RecordInvalid do
    head :bad_request
  end

  def authorize(user)
    payload = { user_id: user.id }
    token = JWT.encode(payload, 'jwt_secret')
    { token: token }
  end
end
