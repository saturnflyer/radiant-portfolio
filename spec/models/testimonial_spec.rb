require File.dirname(__FILE__) + '/../spec_helper'

describe Testimonial do
  dataset :portfolio
  before(:each) do
    @testimonial = testimonials(:vikram_khemani)
  end
  
  it "should be valid" do
    @testimonial.should be_valid
  end

  it "should not be valid without an author" do
    @testimonial.author = nil
    @testimonial.should_not be_valid
  end
  
  it "should not be valid without a comment" do
    @testimonial.comment = nil
    @testimonial.should_not be_valid
  end
end
