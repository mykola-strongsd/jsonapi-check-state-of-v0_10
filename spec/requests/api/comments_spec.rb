require 'rails_helper'

RSpec.describe Api::V1::CommentsController, type: :request do
  before { set_current_user 3 }

  describe 'GET #index' do
    it 'return all items without pagination' do
      get_json api_comments_path
      expect_status 200
      expect(parsed_json[:meta][:"record-count"]).to eq 45
    end
  end
end
