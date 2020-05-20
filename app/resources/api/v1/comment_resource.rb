module Api
  module V1
    class CommentResource < BaseResource
      attributes :content

      belongs_to :author, class_name: 'Author'
      belongs_to :article
      has_many :tags
    end
  end
end
