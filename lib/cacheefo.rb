module Model::Cache 
  def self.included(base)
    base.send :include, InstanceMethods
    base.instance_eval do
      alias_method_chain :to_xml, :cache
      alias_method_chain :as_json, :cache
    end    
  end

  module InstanceMethods
    def cache_key format
      "#{self.class.name}_#{self.id}_#{self.updated_at.to_f}_#{format}"
    end

    def to_xml_with_cache(options = {})
      if options.has_key?(:without_cache)
        to_xml_without_cache(options)
      else
        builder = options.delete(:builder)

        result = Rails.cache.fetch( cache_key("xml") ) do
          to_xml_without_cache(options.merge(:skip_instruct => true))
        end

        builder << result if builder
        result
      end
    end

    def as_json_with_cache(options = {})
      Rails.cache.fetch( cache_key("json") ) do
        as_json_without_cache(options)
      end
    end
  end
end 