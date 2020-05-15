module Api
  module V1
    class ArticleResource < BaseResource
      attributes :title

      has_many :comments
      has_many :tags
    end
  end
end
