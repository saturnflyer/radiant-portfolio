require File.dirname(__FILE__) + '/../spec_helper'

describe Project do
  before(:each) do
    @project = Project.new(:name => 'Test')
  end

  it "should be valid" do
    @project.should be_valid
  end
  
  it "should err without a name" do
    @project.name = nil
    @project.should_not be_valid
  end
end
