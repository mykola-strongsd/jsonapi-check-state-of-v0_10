module Api
  module V1
    class BaseJsonapiController < ActionController::API
      include JSONAPI::ActsAsResourceController
      rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

      # include Pundit
      # after_action :verify_policy_scoped

      def current_user
        raise 'No CURRENT_USER_ID specified!' unless ENV['CURRENT_USER_ID']

        @current_user ||= User.find(ENV['CURRENT_USER_ID'])
      end

      private

      def context
        { current_user: current_user }
      end

      def user_not_authorized
        Rails.logger.info "403 / Pundit::NotAuthorizedError for #{current_user.username}"
        head :forbidden
      end
    end
  end
end
