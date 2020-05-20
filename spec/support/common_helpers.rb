module CommonHelpers
  def parsed_json
    JSON.parse(last_response.body).deep_symbolize_keys!
  end

  def set_current_user(user)
    raise 'Can not set CURRENT_USER_ID' unless user && user.is_a?(User)
    ENV['CURRENT_USER_ID'] = user.id.to_s
  end

  def current_user_id
    raise 'No CURRENT_USER_ID' unless ENV['CURRENT_USER_ID']
    ENV['CURRENT_USER_ID']
  end

  def expect_status(code)
     expect(last_response.status).to eq(code)
  end

  def full_access_user
    User.find_by_username("user 3 / access full")
  end
end