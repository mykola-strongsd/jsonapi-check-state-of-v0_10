require 'rails_helper'

RSpec.describe Api::V1::ArticlesController, type: :request do
  before { set_current_user(full_access_user) }
  let(:article) { Article.first }
  let(:author) { User.first }

  # articles#index

  describe 'GET /api/articles' do
    it 'returns all items without pagination' do
      get_json api_articles_path
      expect_status 200
      expect(parsed_json[:meta][:"record-count"]).to eq 6
      expect(parsed_json[:data].size).to eq 6
    end
    it 'returns all items with pagination' do
      get_json api_articles_path, { 'page[size]': 1 }
      expect_status 200
      expect(parsed_json[:meta][:"record-count"]).to eq 6
      expect(parsed_json[:data].size).to eq 1
    end
  end

  # articles#show

  describe 'GET /api/articles/:id' do
    it 'returns item details' do
      get_json api_article_path(article.id)
      expect_status 200
      expect(parsed_json[:data][:type]).to eq 'articles'
      expect(parsed_json[:data][:id]).to eq article.id.to_s
    end
  end  

  # articles#create

  describe 'POST /api/articles' do
    context 'simple' do
      let(:payload) do
        { data: {
          type: "articles",
          attributes: { "title": "article new" }
        } } 
      end
      it 'creates item' do
        count_articles = Article.count
        post_json api_articles_path, payload
        expect_status 201
        expect(Article.count).to eq(count_articles + 1)
      end
    end
    context 'with relationships' do
      let(:payload) do
        { data: {
          type: "articles",
          relationships: {
            "author": { "data": { "type": "authors", "id": author.id } }
          },
          attributes: { "title": "article new" }
        } }
      end
      it 'creates item' do
        count_articles = Article.count
        post_json api_articles_path, payload
        expect_status 201
        expect(Article.count).to eq(count_articles + 1)
        expect(Article.last.author_id).to eq author.id
      end
    end
  end

  # articles#update

  describe 'PATCH /api/articles/:id' do
    context 'simple' do
      let(:payload) do
        { data: {
          type: "articles",
          id: article.id,
          attributes: { "title": "article changed" }
        } }
      end
      it 'updates item' do
        patch_json api_article_path(article.id), payload
        expect_status 200
        article.reload
        expect(article.title).to eq "article changed"
      end
    end
    context 'with relationships' do
      let(:new_author) { User.last }
      let(:payload) do
        { data: {
          type: "articles",
          id: article.id,
          relationships: {
            "author": { "data": { "type": "authors", "id": new_author.id } }
          },
          attributes: { "title": "article changed" }
        } }
      end
      it 'updates item' do
        patch_json api_article_path(article.id), payload
        expect_status 200
        article.reload
        expect(article.author_id).to eq new_author.id
        expect(article.title).to eq "article changed"
      end    
    end
  end

  # articles#update

  describe 'PUT /api/articles/:id' do
    context 'simple' do
      let(:payload) do
        { data: {
          type: "articles",
          id: article.id,
          attributes: { "title": "article changed" }
        } }
      end
      it 'updates item' do
        patch_json api_article_path(article.id), payload
        expect_status 200
        article.reload
        expect(article.title).to eq "article changed"
      end
    end
    context 'with relationships' do
      let(:new_author) { User.last }
      let(:payload) do
        { data: {
          type: "articles",
          id: article.id,
          relationships: {
            "author": { "data": { "type": "authors", "id": new_author.id } }
          },
          attributes: { "title": "article changed" }
        } }
      end
      it 'updates item' do
        patch_json api_article_path(article.id), payload
        expect_status 200
        article.reload
        expect(article.author_id).to eq new_author.id
        expect(article.title).to eq "article changed"
      end    
    end
  end  

  # articles#destroy

  describe 'DELETE /api/articles/:id' do
    it 'destroys item' do
      delete_json api_article_path(article.id)
      expect_status 204
      expect(Article.find_by_id(article.id)).to be nil
    end
  end
end
