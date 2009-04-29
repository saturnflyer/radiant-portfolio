require File.dirname(__FILE__) + '/../spec_helper'

describe Client do
  before(:each) do
    @client = Client.new
  end

  it "should have at least 1 client text" do
    @client.save!
    @client.should have_at_least(1).client_texts
  end
end
