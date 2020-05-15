module Api
  module V1
    class MeResource < BaseResource
      model_name 'User'

      attributes :username

      singleton singleton_key: lambda { |context|
        key = context[:current_user]&.id
        raise JSONAPI::Exceptions::RecordNotFound, nil if key.nil?

        key
      }

      # has_many :articles, inverse_relationship: :author
      # has_many :comments, inverse_relationship: :author
    end
  end
end
