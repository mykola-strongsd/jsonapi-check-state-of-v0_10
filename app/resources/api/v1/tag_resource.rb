module Api
  module V1
    class TagResource < BaseResource
      attributes :tag_name

      belongs_to :taggable, polymorphic: true, always_include_linkage_data: true

      # for test
      # belongs_to :article, class_name: 'Article', foreign_key: 'taggable_id'
      # belongs_to :comment, class_name: 'Comment', foreign_key: 'taggable_id'
    end
  end
end
