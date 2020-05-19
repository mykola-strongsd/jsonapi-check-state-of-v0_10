require 'rails_helper'

RSpec.describe Api::V1::ArticlesController, type: :request do
  before { set_current_user 3 }

  describe 'GET #index' do
    it 'return all items without pagination' do
      get_json api_articles_path
      expect_status 200
      expect(parsed_json[:meta][:"record-count"]).to eq 6
    end
  end
end
