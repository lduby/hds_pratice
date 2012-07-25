require 'spec_helper'

describe Publisher do

  before(:each) do
    @attr = { 
      :name => "Example Publisher"
    }
  end
  
  it "should reject too short names (<2 characters)" do 
    too_short_name_publisher = Publisher.new(@attr.merge(:name => "a"))
    too_short_name_publisher.should_not be_valid
  end
  
  it "should reject too long names (>255 characters)" do 
    too_long_name_publisher = Publisher.new(@attr.merge(:name => "Example Publisher Example Publisher Example Publisher Example Publisher Example Publisher Example Publisher Example Publisher Example Publisher Example Publisher Example Publisher Example Publisher Example Publisher Example Publisher Example Publisher Example Publisher"))
    too_long_name_publisher.should_not be_valid
  end
  
  it "should accept valid names" do
    Publisher.create!(@attr)
  end
  
  it "should reject duplicate names" do
    Publisher.create!(@attr)
    publisher_with_duplicate_name = Publisher.new(@attr)
    publisher_with_duplicate_name.should_not be_valid
  end
end
