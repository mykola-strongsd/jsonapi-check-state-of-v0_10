class SeedGenerator
  TAGS = %w{Health Business Beauty Fashion Music Food Lifestyle Travel Gardening Finance Yoga}

  def generate
    user_with_articles = User.create!(username: 'user_with_articles')
    user_without_articles = User.create!(username: 'user_without_articles')
    user_3 = User.create!(username: 'user 3')
    user_4 = User.create!(username: 'user 4')
    user_5 = User.create!(username: 'user 5')
    
    article_with_comments = Article.create!(title: 'article_with_comments')
    article_without_comments = Article.create!(title: 'article_without_comments')
    article_with_author = Article.create!(title: 'article_with_author', author: user_with_articles)
    article_without_author = Article.create!(title: 'article_without_author')

    User.all.each do |user|
      3.times do
        article_with_comments.comments.create!(content: 'comment', author: user)
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
