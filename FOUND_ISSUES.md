# GET /api/articles/:article_id/author
(when author is not present)

```
Internal Server Error: undefined method `resource_klass' for nil:NilClass /home/dev/.rvm/gems/ruby-2.6.5/bundler/gems/jsonapi-authorization-762718244b80/lib/jsonapi/authorization/authorizing_processor.rb:294:in `resources_from_relationship'
/home/dev/.rvm/gems/ruby-2.6.5/bundler/gems/jsonapi-authorization-762718244b80/lib/jsonapi/authorization/authorizing_processor.rb:94:in `authorize_show_related_resource'
/home/dev/.rvm/gems/ruby-2.6.5/gems/activesupport-6.0.3/lib/active_support/callbacks.rb:428:in `block in make_lambda'
...
Completed 500 Internal Server Error in 183ms (Views: 10.2ms | ActiveRecord: 3.4ms | Allocations: 17533)
```