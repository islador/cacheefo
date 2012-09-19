## Cacheefo

[![Build Status](https://secure.travis-ci.org/defsan/cacheefo.png)](http://travis-ci.org/defsan/cacheefo)

Lazy caches serilization of ActiveRecord such as to_xml and as_json. Practically used in API calls where it can be used like:
>
> respond_with( Article.first )
>

## Getting started

+ Supports Ruby version: 1.9.2
+ Supports cache store
+ Supports Rails 3

Add to your Gemfile:

```ruby
gem "cacheefo"
```

and run at the command prompt:
```ruby
bundle install
```

Gem automatically replace to_xml and as_json methods for ActiveRecord::Base, so it can use it right away.
Don't forget rails cache configuration is disabled in development environment. To switch it on here is the configuration for "config/environments/development.rb":

```ruby
config.action_controller.perform_caching = true
config.cache_store = :memory_store
```


Read more about [Caching with Rails](http://guides.rubyonrails.org/caching_with_rails.html)


## In depth
Cacheefo use lazy caching, that means that cached info is based on `updated_at` attribute to generate cache_key, this create interesting behavor where updated object always will have different cache_key and will automatically be regenerated. Also it may create consern of expiring old records, for this purpose highly recommended to use storage that supports self expiring caches, such as MemCache.

Expire all model caches can be done with calling `touch` method,
```ruby
@article.touch #will expire all cache for current record 
```
 and same thing for association in class
```ruby
class Comment
  belongs_to :article, touch: true
end
```
There is nice RailsCast episode [#90 Fragment Caching](http://railscasts.com/episodes/90-fragment-caching-revised) describing how ActiveRecord cache_key can be used in Rails.

Because Cacheefo overrides cache_key method of a model, you can always retrieve cached serialized model doing
```ruby
Rails.cache.read( Article.cache_key(:xml) )   # for xml format
Rails.cache.read( Article.cache_key(:json) )  # for json format
```
Still it doesn't interfear with standart model caching behavor, where you can use model to generate fragment cache.
```ruby
<% cache @article do %>
...
<% end %>
```



## License
MIT License. Copyright 2012 Ihor Ratsyborynskyy
