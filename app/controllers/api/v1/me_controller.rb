module Api
  module V1
    class MeController < Api::V1::BaseJsonapiController
      private

      def params
        super.merge(id: current_user.try(:id))
      end
    end
  end
end
