require File.dirname(__FILE__) + '/../spec_helper'

describe ProjectText do
  before(:each) do
    @project_text = ProjectText.new
  end

  it "should be valid" do
    @project_text.should be_valid
  end
end
