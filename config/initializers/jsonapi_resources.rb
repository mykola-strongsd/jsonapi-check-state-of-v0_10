JSONAPI.configure do |config|
  # built in paginators are :none, :offset, :paged
  config.default_paginator = :custom_paged

  config.default_page_size = 10
  config.maximum_page_size = 200

  config.top_level_links_include_pagination = false
  config.top_level_meta_include_record_count = true

  config.default_processor_klass = JSONAPI::Authorization::AuthorizingProcessor
  config.exception_class_whitelist = [Pundit::NotAuthorizedError]
end

class CustomPagedPaginator < PagedPaginator
  attr_reader :disable_pagination

  def initialize(params)
    @disable_pagination = params.nil?
    super
  end

  def apply(relation, _order_options)
    disable_pagination ? relation : super
  end
end
