module Api
  module V1
    class AuthorResource < BaseResource
      immutable

      model_name 'User'
      attributes :username

      has_many :articles
      has_many :comments
    end
  end
end
