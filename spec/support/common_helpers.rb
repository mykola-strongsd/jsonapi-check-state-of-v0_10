module CommonHelpers
  def parsed_json
    JSON.parse(last_response.body).deep_symbolize_keys!
  end

  def set_current_user(id)
    ENV['CURRENT_USER_ID'] = id.to_s
  end

  def expect_status(code)
     expect(last_response.status).to eq(code)
  end
end