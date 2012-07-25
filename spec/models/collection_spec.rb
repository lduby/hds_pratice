require 'spec_helper'

describe Collection do

  before(:each) do
    @attr = { 
      :name => "Example Collection"
    }
  end
  
  it "should reject too short names (<2 characters)" do 
    too_short_name_collection = Collection.new(@attr.merge(:name => "a"))
    too_short_name_collection.should_not be_valid
  end
  
  it "should reject too long names (>255 characters)" do 
    too_long_name_collection = Collection.new(@attr.merge(:name => "Example Collection Example Collection Example Collection Example Collection Example Collection Example Collection Example Collection Example Collection Example Collection Example Collection Example Collection Example Collection Example Collection Example Collection Example Collection"))
    too_long_name_collection.should_not be_valid
  end
  
  it "should accept valid names" do
    Collection.create!(@attr)
  end
  
  it "should reject duplicate names" do
    Collection.create!(@attr)
    collection_with_duplicate_name = Collection.new(@attr)
    collection_with_duplicate_name.should_not be_valid
  end
end
