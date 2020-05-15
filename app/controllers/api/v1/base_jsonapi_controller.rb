module Api
  module V1
    class BaseJsonapiController < ActionController::API
      include JSONAPI::ActsAsResourceController
      rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

      def current_user
        @current_user ||= User.first
      end

      private

      def context
        { current_user: current_user }
      end

      def user_not_authorized
        head :forbidden
      end
    end
  end
end
