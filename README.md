# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Routes
```

     api_article_relationships_author GET       /api/articles/:article_id/relationships/author(.:format)                                 api/v1/articles#show_relationship {:relationship=>"author"}
                                      PUT|PATCH /api/articles/:article_id/relationships/author(.:format)                                 api/v1/articles#update_relationship {:relationship=>"author"}
                                      DELETE    /api/articles/:article_id/relationships/author(.:format)                                 api/v1/articles#destroy_relationship {:relationship=>"author"}
           api_article_related_author GET       /api/articles/:article_id/author(.:format)                                               api/v1/authors#show_related_resource {:relationship=>"author", :source=>"api/v1/articles"}
   api_article_relationships_comments GET       /api/articles/:article_id/relationships/comments(.:format)                               api/v1/articles#show_relationship {:relationship=>"comments"}
                                      POST      /api/articles/:article_id/relationships/comments(.:format)                               api/v1/articles#create_relationship {:relationship=>"comments"}
                                      PUT|PATCH /api/articles/:article_id/relationships/comments(.:format)                               api/v1/articles#update_relationship {:relationship=>"comments"}
                                      DELETE    /api/articles/:article_id/relationships/comments(.:format)                               api/v1/articles#destroy_relationship {:relationship=>"comments"}
         api_article_related_comments GET       /api/articles/:article_id/comments(.:format)                                             api/v1/comments#index_related_resources {:relationship=>"comments", :source=>"api/v1/articles"}
       api_article_relationships_tags GET       /api/articles/:article_id/relationships/tags(.:format)                                   api/v1/articles#show_relationship {:relationship=>"tags"}
                                      POST      /api/articles/:article_id/relationships/tags(.:format)                                   api/v1/articles#create_relationship {:relationship=>"tags"}
                                      PUT|PATCH /api/articles/:article_id/relationships/tags(.:format)                                   api/v1/articles#update_relationship {:relationship=>"tags"}
                                      DELETE    /api/articles/:article_id/relationships/tags(.:format)                                   api/v1/articles#destroy_relationship {:relationship=>"tags"}
             api_article_related_tags GET       /api/articles/:article_id/tags(.:format)                                                 api/v1/tags#index_related_resources {:relationship=>"tags", :source=>"api/v1/articles"}
                         api_articles GET       /api/articles(.:format)                                                                  api/v1/articles#index
                                      POST      /api/articles(.:format)                                                                  api/v1/articles#create
                          api_article GET       /api/articles/:id(.:format)                                                              api/v1/articles#show
                                      PATCH     /api/articles/:id(.:format)                                                              api/v1/articles#update
                                      PUT       /api/articles/:id(.:format)                                                              api/v1/articles#update
                                      DELETE    /api/articles/:id(.:format)                                                              api/v1/articles#destroy
     api_comment_relationships_author GET       /api/comments/:comment_id/relationships/author(.:format)                                 api/v1/comments#show_relationship {:relationship=>"author"}
                                      PUT|PATCH /api/comments/:comment_id/relationships/author(.:format)                                 api/v1/comments#update_relationship {:relationship=>"author"}
                                      DELETE    /api/comments/:comment_id/relationships/author(.:format)                                 api/v1/comments#destroy_relationship {:relationship=>"author"}
           api_comment_related_author GET       /api/comments/:comment_id/author(.:format)                                               api/v1/authors#show_related_resource {:relationship=>"author", :source=>"api/v1/comments"}
       api_comment_relationships_tags GET       /api/comments/:comment_id/relationships/tags(.:format)                                   api/v1/comments#show_relationship {:relationship=>"tags"}
                                      POST      /api/comments/:comment_id/relationships/tags(.:format)                                   api/v1/comments#create_relationship {:relationship=>"tags"}
                                      PUT|PATCH /api/comments/:comment_id/relationships/tags(.:format)                                   api/v1/comments#update_relationship {:relationship=>"tags"}
                                      DELETE    /api/comments/:comment_id/relationships/tags(.:format)                                   api/v1/comments#destroy_relationship {:relationship=>"tags"}
             api_comment_related_tags GET       /api/comments/:comment_id/tags(.:format)                                                 api/v1/tags#index_related_resources {:relationship=>"tags", :source=>"api/v1/comments"}
                         api_comments GET       /api/comments(.:format)                                                                  api/v1/comments#index
                                      POST      /api/comments(.:format)                                                                  api/v1/comments#create
                          api_comment GET       /api/comments/:id(.:format)                                                              api/v1/comments#show
                                      PATCH     /api/comments/:id(.:format)                                                              api/v1/comments#update
                                      PUT       /api/comments/:id(.:format)                                                              api/v1/comments#update
                                      DELETE    /api/comments/:id(.:format)                                                              api/v1/comments#destroy
       api_tag_relationships_taggable GET       /api/tags/:tag_id/relationships/taggable(.:format)                                       api/v1/tags#show_relationship {:relationship=>"taggable"}
                                      PUT|PATCH /api/tags/:tag_id/relationships/taggable(.:format)                                       api/v1/tags#update_relationship {:relationship=>"taggable"}
                                      DELETE    /api/tags/:tag_id/relationships/taggable(.:format)                                       api/v1/tags#destroy_relationship {:relationship=>"taggable"}
             api_tag_related_taggable GET       /api/tags/:tag_id/taggable(.:format)                                                     api/v1/taggables#show_related_resource {:relationship=>"taggable", :source=>"api/v1/tags"}
                             api_tags GET       /api/tags(.:format)                                                                      api/v1/tags#index
                                      POST      /api/tags(.:format)                                                                      api/v1/tags#create
                              api_tag GET       /api/tags/:id(.:format)                                                                  api/v1/tags#show
                                      PATCH     /api/tags/:id(.:format)                                                                  api/v1/tags#update
                                      PUT       /api/tags/:id(.:format)                                                                  api/v1/tags#update
                                      DELETE    /api/tags/:id(.:format)                                                                  api/v1/tags#destroy
```