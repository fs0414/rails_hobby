class BaseController < ApplicationController
  include Sorcery::Controller

  def authorize(user)
    payload = { user_id: user.id }
    token = JWT.encode(payload, 'jwt_secret')
    { token: token }
  end
end
