module Api
  module V1
    class UserResource < BaseResource
      attributes :username

      singleton singleton_key: lambda { |context|
        key = context[:current_user]&.id
        raise JSONAPI::Exceptions::RecordNotFound, nil if key.nil?

        key
      }

      has_many :articles
      has_many :comments
    end
  end
end
