module Api
  module V1
    class TagResource < BaseResource
      attributes :tag_name

      belongs_to :taggable, polymorphic: true
    end
  end
end
