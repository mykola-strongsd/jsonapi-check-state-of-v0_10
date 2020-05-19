class Tag < ApplicationRecord
  belongs_to :taggable, polymorphic: true

  # for test
  # belongs_to :article, -> { where( tags: { taggable_type: 'Article' } ).eager_load( :tags ) }, foreign_key: 'taggable_id'
  # belongs_to :comment, -> { where( tags: { taggable_type: 'Comment' } ).eager_load( :tags ) }, foreign_key: 'taggable_id'
end
