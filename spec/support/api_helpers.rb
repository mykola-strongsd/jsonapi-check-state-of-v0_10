module ApiHelpers
  def build_default_headers(content_type)
    {
      'HTTPS' => 'on',
      'Content-Type' => content_type,
      'Accept' => content_type,
      'Accept-Version' => 'v1'
    }
  end

  def json_headers
    headers_hash = build_default_headers('application/vnd.api+json')
    headers_hash['HTTP_AUTHORIZATION'] = "Bearer #{@access_token}" if @access_token
    headers_hash
  end

  def get_json(path, headers = {})
    json_headers.merge(headers).each { |k, v| header(k, v) }
    get path
  end

  def post_json(path, payload = {}, headers = {})
    json_headers.merge(headers).each { |k, v| header(k, v) }
    post path, payload.to_json
  end

  def patch_json(path, payload = {}, headers = {})
    json_headers.merge(headers).each { |k, v| header(k, v) }
    patch path, payload.to_json
  end

  def put_json(path, payload = {}, headers = {})
    json_headers.merge(headers).each { |k, v| header(k, v) }
    put path, payload.to_json
  end

  def delete_json(path, headers = {})
    json_headers.merge(headers).each { |k, v| header(k, v) }
    delete path
  end
end
