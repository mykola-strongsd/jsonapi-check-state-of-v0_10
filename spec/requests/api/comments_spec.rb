require 'rails_helper'

RSpec.describe Api::V1::CommentsController, type: :request do  
  before { set_current_user 3 }
  let(:current_user_id) { 3.to_s }
  let(:author_id) { 1 }

  # comments#index
  describe 'GET #index' do
    it 'return all items without pagination' do
      get_json api_comments_path
      expect_status 200
      expect(parsed_json[:meta][:"record-count"]).to eq 45
    end
  end

  # comments#create
  describe 'POST /api/comments' do
    let(:payload) do
      { "data": { "type": "comments", 
        "relationships": {
            "article": { "data": { "id": "1", "type": "articles" } },
            "author": { "data": { "type": "authors", "id": author_id } }
        },
        "attributes": { "content": "comment new" }
      } }
    end

    it 'works' do
      header "Content-Type", 'application/vnd.api+json'
      post api_comments_path, payload.to_json
      expect_status 201
    end
  end  

  # comments#show
  describe 'GET /api/comments/:id' do
    it 'works' do
      #TODO
      expect_status 200
    end
  end  

  # comments#update
  describe 'PATCH /api/comments/:id' do
    it 'works' do
      #TODO
      expect_status 200
    end
  end  

  # comments#update
  describe 'PUT /api/comments/:id' do
    it 'works' do
      #TODO
      expect_status 200
    end
  end  

  # comments#destroy
  describe 'DELETE /api/comments/:id' do
    it 'works' do
      #TODO
      expect_status 200
    end
  end  
end
