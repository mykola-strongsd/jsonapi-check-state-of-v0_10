class User < ApplicationRecord
  has_many :articles, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id

  def access_full?
    access == 'full'
  end

  def access_own?
    access == 'own'
  end

  def access_none?
    !%( full own ).include?(access)
  end
end
