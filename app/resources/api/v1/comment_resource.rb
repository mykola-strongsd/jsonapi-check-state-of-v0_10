module Api
  module V1
    class CommentResource < BaseResource
      attributes :content

      has_many :tags
    end
  end
end
