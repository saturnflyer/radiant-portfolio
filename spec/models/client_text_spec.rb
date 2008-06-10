require File.dirname(__FILE__) + '/../spec_helper'

describe ClientText do
  before(:each) do
    @client_text = ClientText.new
  end

  it "should be valid" do
    @client_text.should be_valid
  end
end
