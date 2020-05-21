module Api
  module V1
    class TagResource < BaseResource
      attributes :tag_name

      has_one :taggable, polymorphic: true, always_include_linkage_data: true

      # for test
      # has_one :article, class_name: 'Article', foreign_key: 'taggable_id'
      # has_one :comment, class_name: 'Comment', foreign_key: 'taggable_id'
    end
  end
end
