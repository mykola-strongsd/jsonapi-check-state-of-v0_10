require 'rails_helper'

RSpec.describe Api::V1::ArticlesController, type: :request do
  before { set_current_user(full_access_user) }
  
  # api/v1/authors#show_related_resource {:relationship=>"author", :source=>"api/v1/articles"}

  describe 'GET /api/articles/:article_id/author' do
    context 'article without author' do
      let(:article) { Article.first }
      it 'returns related item details' do
        get_json api_article_related_author_path(article.id)
        expect_status 200
        expect(parsed_json[:data]).to be nil
      end
    end

    context 'article with author' do
      let(:article) { Article.find_by_id(3) }
      it 'returns related item details' do
        get_json api_article_related_author_path(article.id)
        expect_status 200
        expect(parsed_json[:data][:type]).to eq 'authors'
        expect(parsed_json[:data][:id]).to eq article.author_id.to_s
      end
    end
  end

  # api/v1/comments#index_related_resources {:relationship=>"comments", :source=>"api/v1/articles"}

  describe 'GET /api/articles/:article_id/comments' do
    context 'article without comments' do
      let(:article) { Article.find_by_id(2) }
      it 'returns related items details' do
        get_json api_article_related_comments_path(article.id)
        expect_status 200
        expect(parsed_json[:data].size).to eq 0
        expect(parsed_json[:meta][:"record-count"]).to eq 0
      end
    end

    context 'article with comments' do
      let(:article) { Article.first }
      it 'returns related items details' do
        get_json api_article_related_comments_path(article.id)
        expect_status 200
        expect(parsed_json[:data].size).to eq 15
        expect(parsed_json[:meta][:"record-count"]).to eq 15
      end
    end
  end
end
