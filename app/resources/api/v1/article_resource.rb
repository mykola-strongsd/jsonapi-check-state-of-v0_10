module Api
  module V1
    class ArticleResource < BaseResource
      attributes :title

      has_one :author, class_name: 'Author'
      has_many :comments
      has_many :tags
    end
  end
end
