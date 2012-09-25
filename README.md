## Cacheefo

[![Build Status](https://secure.travis-ci.org/defsan/cacheefo.png)](http://travis-ci.org/defsan/cacheefo)

Lazy caches serilization of ActiveRecord such as to_xml and as_json. Practically used in API calls where it can be invoked in the manner below:
>
> respond_with( Article.first )
>

## Getting started

+ Supports Ruby version: 1.9.2
+ Supports cache store
+ Supports Rails 3

Add the following to your Gemfile:

```ruby
gem "cacheefo"
```

and run at the command prompt:
```ruby
bundle install
```

This Gem automatically overrides the 'to_xml' and 'as_json' methods for ActiveRecord::Base, so it can be used right away.
Don't forget that rails cache configuration is disabled in the development environment by default. To change this add the below lines to "config/environments/development.rb"

```ruby
config.action_controller.perform_caching = true
config.cache_store = :memory_store
```


Read more about caching methods here at [Caching with Rails](http://guides.rubyonrails.org/caching_with_rails.html).


## In depth

Cacheefo uses lazy caching to provide new cache keys. This means that new cache_keys are automatically generated each time the object is updated and old ones are not removed. For this reason it is reccomended to use storage methods that support self expiring caches, such as MemCache.

To Expire all model caches call the `touch` method,
```ruby
@article.touch #will expire all cache for current record 
```
 and same thing for a class association
```ruby
class Comment
  belongs_to :article, touch: true
end
```
There is a nice RailsCast episode describing how ActiveRecord cache_key can be used in Rails that may help you understand this gem. [#90 Fragment Caching](http://railscasts.com/episodes/90-fragment-caching-revised)

Because Cacheefo overrides the cache_key method of a model, you can always retrieve the cached serialized model by doing
```ruby
Rails.cache.read( Article.cache_key(:xml) )   # for xml format
Rails.cache.read( Article.cache_key(:json) )  # for json format
```
However it doesn't interfere with the standard model caching behavor, so it is still possible to use model to generate the fragment cache.
```ruby
<% cache @article do %>
...
<% end %>
```



## License
MIT License. Copyright 2012 Ihor Ratsyborynskyy
