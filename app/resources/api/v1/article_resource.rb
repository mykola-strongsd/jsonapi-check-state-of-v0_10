module Api
  module V1
    class ArticleResource < BaseResource
      attributes :title

      belongs_to :author, class_name: 'Author'
      has_many :comments
      has_many :tags
    end
  end
end
