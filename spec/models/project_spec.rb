require File.dirname(__FILE__) + '/../spec_helper'

describe Project do
  before(:each) do
    @project = Project.new
  end

  it "should be valid" do
    @project.should be_valid
  end
end
