require 'spec_helper'

describe Author do

  before(:each) do
    @attr = { 
      :first_name => "Herve",
      :last_name => "Tullet"
    }
  end
  
  it "should create a new instance given a valid attribute" do
    Author.create!(@attr)
  end
  
  it "should require a last_name" do 
    no_last_name_author = Author.new(@attr.merge(:last_name => ""))
    no_last_name_author.should_not be_valid
  end
  
  it "should require a first_name" do 
    no_first_name_author = Author.new(@attr.merge(:first_name => ""))
    no_first_name_author.should_not be_valid
  end
end
