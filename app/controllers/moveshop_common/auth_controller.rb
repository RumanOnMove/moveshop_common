module MoveshopCommon
  class AuthController < Spree::Api::V2::BaseController
    include ActionController::RequestForgeryProtection
    protect_from_forgery with: :exception

    # Checking authorization
    def authorize_admin
      # Checking if the authenticated user is an admin
      unless spree_current_user
        render json: { error: 'The access token expired' }, status: :unauthorized
      end
    end
  end
end
