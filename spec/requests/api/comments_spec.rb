require 'rails_helper'

RSpec.describe Api::V1::CommentsController, type: :request do   
  before { set_current_user(full_access_user) }
  let(:comment) { Comment.first }

  # comments#index
  describe 'GET #index' do
    it 'returns all items without pagination' do
      get_json api_comments_path
      expect_status 200
      expect(parsed_json[:meta][:"record-count"]).to eq 45
      expect(parsed_json[:data].size).to eq 45
    end
    it 'returns all items with pagination' do
      get_json api_comments_path, { 'page[size]': 1 }
      expect_status 200
      expect(parsed_json[:meta][:"record-count"]).to eq 45
      expect(parsed_json[:data].size).to eq 1
    end
  end

  # comments#show
  describe 'GET /api/comments/:id' do
    it 'returns item details' do
      get_json api_comment_path(comment.id)
      expect_status 200
      expect(parsed_json[:data][:type]).to eq 'comments'
      expect(parsed_json[:data][:id]).to eq comment.id.to_s
    end
  end

  # comments#create
  describe 'POST /api/comments' do
    let(:author) { User.first }
    let(:article) { Article.first }
    let(:payload) do
      { "data": {
        "type": "comments",
        "relationships": {
            "article": { "data": { "id": article.id, "type": "articles" } },
            "author": { "data": { "type": "authors", "id": author.id } }
        },
        "attributes": { "content": "comment new" }
      } }
    end

    it 'creates item' do
      count_articles_comments = article.comments.count
      count_author_comments = author.comments.count
      post_json api_comments_path, payload
      expect_status 201
      expect(article.comments.count).to eq(count_articles_comments + 1)
      expect(author.comments.count).to eq(count_author_comments + 1)
    end
  end  

  # comments#update
  describe 'PATCH /api/comments/:id' do
    let(:new_author) { User.last }
    let(:new_article) { Article.last }
    let(:payload) do
      { "data": {
        "type": "comments", "id": comment.id,
        "relationships": {
          "article": { "data": { "id": new_article.id, "type": "articles" } },
          "author": { "data": { "type": "authors", "id": new_author.id } }
        },
        "attributes": { "content": "comment changed" }
      } }
    end
    it 'updates item' do
      patch_json api_comment_path(comment.id), payload
      expect_status 200
      comment.reload
      expect(comment.article_id).to eq new_article.id
      expect(comment.author_id).to eq new_author.id
      expect(comment.content).to eq "comment changed"
    end
  end

  # comments#update
  describe 'PUT /api/comments/:id' do
    let(:new_author) { User.last }
    let(:new_article) { Article.last }
    let(:payload) do
      { "data": {
        "type": "comments", "id": comment.id,
        "relationships": {
          "article": { "data": { "id": new_article.id, "type": "articles" } },
          "author": { "data": { "type": "authors", "id": new_author.id } }
        },
        "attributes": { "content": "comment changed" }
      } }
    end
    it 'updates item' do
      put_json api_comment_path(comment.id), payload
      expect_status 200
      comment.reload
      expect(comment.article_id).to eq new_article.id
      expect(comment.author_id).to eq new_author.id
      expect(comment.content).to eq "comment changed"
    end
  end  

  # comments#destroy
  describe 'DELETE /api/comments/:id' do
    it 'destroys item' do
      delete_json api_comment_path(comment.id)
      expect_status 204
      expect(Comment.find_by_id(comment.id)).to be nil
    end
  end  
end
