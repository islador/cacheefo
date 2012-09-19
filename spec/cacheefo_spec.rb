require 'spec_helper'
require 'cacheefo'

describe "TestModel" do 
  before(:each) do
    @testModel = TestModel.create
  end

  context "Methods" do
    # Testing cache_key for consistancy of format 
    it "#cache_key without :format should be html" do
      @testModel.cache_key.should == "test_models/#{@testModel.id}-#{@testModel.updated_at.to_s(:number)}.html"
    end

    it "#cache_key with :format = :xml should" do
      @testModel.cache_key(:xml).should == "test_models/#{@testModel.id}-#{@testModel.updated_at.to_s(:number)}.xml"
    end

    it "#to_xml should cache" do
      xml = @testModel.to_xml
      xml.should == Rails.cache.read( @testModel.cache_key(:xml) )
    end

    it "#as_json should cache" do
      json = @testModel.as_json
      json.should == Rails.cache.read( @testModel.cache_key(:json) )
    end
  end
  
end