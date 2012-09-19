require "cacheefo/version"

module Cacheefo
  extend self

  def included( base )
    base.instance_eval do
      alias_method_chain :to_xml, :cache
      alias_method_chain :as_json, :cache
      alias_method_chain :cache_key, :cache
    end
  end

  
  #
  # Override cache_key to have format. By default :html, 
  # that can be used to generate fragment caching
  #
  def cache_key_with_cache( format = :html )
    "#{cache_key_without_cache}.#{format.to_s}"
  end

  def to_xml_with_cache(options = {})
    if options.has_key?(:without_cache)
      to_xml_without_cache(options)
    else
      builder = options.delete(:builder)

      result = ::Rails.cache.fetch( cache_key("xml") ) do
        to_xml_without_cache(options.merge(:skip_instruct => true))
      end

      builder << result if builder
      result
    end
  end

  def as_json_with_cache(options = {})
    ::Rails.cache.fetch( cache_key("json") ) do 
      as_json_without_cache(options)
    end
  end
end 

if defined?(Rails)
  require "cacheefo/railtie"
  Cacheefo::Railtie.insert
end
