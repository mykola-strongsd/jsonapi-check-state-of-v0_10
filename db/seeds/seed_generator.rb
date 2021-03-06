class SeedGenerator
  TAGS = %w[Health Business Beauty Fashion Music Food Lifestyle Travel Gardening Finance Yoga].freeze

  # user_1_access :own
  # user_2 access :own
  # user_3 access full
  # user_4 access none
  # user_5 access none

  def generate
    user_1_with_articles = User.create!(username: 'user 1 with_articles / access own', access: :own)
    user_2_without_articles = User.create!(username: 'user 2 without_articles / access own', access: :own)
    user_3_access_full = User.create!(username: 'user 3 / access full', access: :full)
    user_4_access_none = User.create!(username: 'user 4 / access none', access: :none)
    user_5_with_articles_access_none = User.create!(username: 'user 5 with_articles / access none', access: :none)

    article_with_comments = Article.create!(title: 'article_with_comments')
    article_without_comments = Article.create!(title: 'article_without_comments')
    article_with_author = Article.create!(title: 'article_with_author', author: user_1_with_articles)
    article_with_author_comments = Article.create!(title: 'article_with_author_comments', author: user_1_with_articles)
    article_without_author = Article.create!(title: 'article_without_author')
    article_with_author_comments_2 = Article.create!(title: 'article_with_author_comments_1', author: user_5_with_articles_access_none)

    User.all.each do |user|
      3.times do
        article_with_comments.comments.create!(content: 'comment', author: user)
        article_with_author_comments.comments.create!(content: 'comment', author: user)
        article_with_author_comments_2.comments.create!(content: 'comment', author: user)
      end
    end

    Article.all.each do |article|
      TAGS.sample(3).each do |tag_name|
        article.tags.create!(tag_name: tag_name)
      end
    end

    Comment.all.each do |comment|
      TAGS.sample(3).each do |tag_name|
        comment.tags.create!(tag_name: tag_name)
      end
    end
  end
end
