module Api
  module V1
    class CommentResource < BaseResource
      attributes :content

      has_one :author, class_name: 'Author'
      has_one :article
      has_many :tags
    end
  end
end
