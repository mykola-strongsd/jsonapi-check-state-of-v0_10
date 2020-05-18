module ApiHelpers
  def headers(content_type)
    {
      'HTTPS' => 'on',
      'Content-Type' => content_type,
      'Accept' => content_type,
      'Accept-Version' => 'v1'
    }
  end

  def json_headers
    headers_hash = headers('application/vnd.api+json')
    headers_hash['HTTP_AUTHORIZATION'] = "Bearer #{@access_token}" if @access_token
    headers_hash
  end

  def post_json(host, params = {}, header_opts = {})
    post host, params: params.to_json, headers: json_headers.merge(header_opts)
  end

  def patch_json(host, params = {}, header_opts = {})
    patch host, params: params.to_json, headers: json_headers.merge(header_opts)
  end

  def delete_json(host, params = {}, header_opts = {})
    delete host, params: params, headers: json_headers.merge(header_opts)
  end

  def get_json(host, params = {}, header_opts = {})
    get host, params: params, headers: json_headers.merge(header_opts)
  end

  def get_xml(host, params = {}, header_opts = {})
    get host, params: params.to_xml, headers: headers('application/xml').merge(header_opts)
  end
end
