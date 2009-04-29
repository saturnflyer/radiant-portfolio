require File.dirname(__FILE__) + '/../spec_helper'

describe Page do
  dataset :portfolio

  describe "clients" do
    it "should expand it's contents" do
      pages(:home).should render('<r:clients>text</r:clients>').as('text')
    end
    describe "each" do
      it "should expand it's contents for each client" do
        pages(:home).should render('<r:clients:each>text </r:clients:each>').as('text text text text text ')
      end
      describe "with limit" do
        it "should limit the records" do
          pages(:home).should render('<r:clients:each limit="3">text </r:clients:each>').as('text text text ')
        end
        it "should error with a non-numeric limit" do
          pages(:home).should render('<r:clients:each limit="abc">text </r:clients:each>').with_error("`limit' attribute of `each' tag must be a positive number between 1 and 4 digits")
        end
        it "should offset the records" do
          pages(:home).should render('<r:clients:each limit="2" offset="1"><r:name /> </r:clients:each>').as('Ignite Social Media Kratos Defense ')
        end
        it "should error with a non-numeric offset" do
          pages(:home).should render('<r:clients:each limit="3" offset="abc">text </r:clients:each>').with_error("`offset' attribute of `each' tag must be a positive number between 1 and 4 digits")
        end
      end
      describe "with ordering" do
        it "should sort by the given by field" do
          pages(:home).should render('<r:clients:each limit="3" by="name"><r:name /> </r:clients:each>').as('Bright Yellow Jacket Ignite Social Media Kratos Defense ')
        end
        it "should default sort by created_at" do
          pages(:home).should render('<r:clients:each limit="3"><r:name /> </r:clients:each>').as('Saturn Flyer Ignite Social Media Kratos Defense ')
        end
        it "should err with an invalid by field" do
          pages(:home).should render('<r:clients:each by="aoeu"><r:name /> </r:clients:each>').with_error("`by' attribute of `each' tag must be set to a valid field name")
        end
        it "should order by the given order field" do
          pages(:home).should render('<r:clients:each limit="3" by="name" order="desc"><r:name /> </r:clients:each>').as('Smithsonian Saturn Flyer Kratos Defense ')
        end
        it "should default order to ascending" do
          pages(:home).should render('<r:clients:each limit="3" by="name"><r:name /> </r:clients:each>').as('Bright Yellow Jacket Ignite Social Media Kratos Defense ')
        end
        it "should err with an invalid order attribute" do
          pages(:home).should render('<r:clients:each order="123"><r:name /></r:clients:each>').with_error(%{`order' attribute of `each' tag must be set to either "asc" or "desc"})
        end
      end
      describe "name" do
        it "should display the client name" do
          pages(:home).should render('<r:clients:each><r:name /> </r:clients:each>').as('Saturn Flyer Ignite Social Media Kratos Defense Smithsonian Bright Yellow Jacket ')
        end
      end
      describe "content" do
        it "should display the client description" do
          pages(:home).should render('<r:clients:each limit="1"><r:content /></r:clients:each>').as('designers and developers')
        end
      end
    end
  end
  
  describe "projects" do
    it "should expand it's contents" do
      pages(:home).should render('<r:projects>text</r:projects>').as('text')
    end
    describe "each" do
      it "should expand it's contents for each project" do
        pages(:home).should render('<r:projects:each>text </r:projects:each>').as('text text text text ')
      end
      describe "with limit" do
        it "should limit the records" do
          pages(:home).should render('<r:projects:each limit="3">text </r:projects:each>').as('text text text ')
        end
        it "should error with a non-numeric limit" do
          pages(:home).should render('<r:projects:each limit="abc">text </r:projects:each>').with_error("`limit' attribute of `each' tag must be a positive number between 1 and 4 digits")
        end
        it "should offset the records" do
          pages(:home).should render('<r:projects:each limit="2" offset="1"><r:name /> </r:projects:each>').as('iris invertebrates ')
        end
        it "should error with a non-numeric offset" do
          pages(:home).should render('<r:projects:each limit="3" offset="abc">text </r:projects:each>').with_error("`offset' attribute of `each' tag must be a positive number between 1 and 4 digits")
        end
      end
      describe "with ordering" do
        it "should sort by the given by field" do
          pages(:home).should render('<r:projects:each limit="3" by="name"><r:name /> </r:projects:each>').as('byj site ignite website invertebrates ')
        end
        it "should default sort by created_at" do
          pages(:home).should render('<r:projects:each limit="3"><r:name /> </r:projects:each>').as('ignite website iris invertebrates ')
        end
        it "should err with an invalid by field" do
          pages(:home).should render('<r:projects:each by="aoeu"><r:name /> </r:projects:each>').with_error("`by' attribute of `each' tag must be set to a valid field name")
        end
        it "should order by the given order field" do
          pages(:home).should render('<r:projects:each limit="3" by="name" order="desc"><r:name /> </r:projects:each>').as('iris invertebrates ignite website ')
        end
        it "should default order to ascending" do
          pages(:home).should render('<r:projects:each limit="3" by="name"><r:name /> </r:projects:each>').as('byj site ignite website invertebrates ')
        end
        it "should err with an invalid order attribute" do
          pages(:home).should render('<r:projects:each order="123"><r:name /></r:projects:each>').with_error(%{`order' attribute of `each' tag must be set to either "asc" or "desc"})
        end
      end
      describe "name" do
        it "should display the client name" do
          pages(:home).should render('<r:projects:each><r:name /> </r:projects:each>').as('ignite website iris invertebrates byj site ')
        end
      end
      describe "content" do
        it "should display the project description" do
          pages(:home).should render('<r:projects:each limit="1"><r:content /></r:projects:each>').as('moving to Radiant')
        end
      end
    end
  end
  
  describe "testimonials" do
    it "should expand it's contents" do
      pages(:home).should render('<r:testimonials>text</r:testimonials>').as('text')
    end
    describe "each" do
      it "should expand it's contents for each item" do
        pages(:home).should render('<r:testimonials:each>text </r:testimonials:each>').as('text text text ')
      end
      describe "with limit" do
        it "should limit the records" do
          pages(:home).should render('<r:testimonials:each limit="3">text </r:testimonials:each>').as('text text text ')
        end
        it "should error with a non-numeric limit" do
          pages(:home).should render('<r:testimonials:each limit="abc">text </r:testimonials:each>').with_error("`limit' attribute of `each' tag must be a positive number between 1 and 4 digits")
        end
        it "should offset the records" do
          pages(:home).should render('<r:testimonials:each limit="2" offset="1"><r:author /> </r:testimonials:each>').as('Vikram Khemani Stephen Oster ')
        end
        it "should error with a non-numeric offset" do
          pages(:home).should render('<r:testimonials:each limit="3" offset="abc">text </r:testimonials:each>').with_error("`offset' attribute of `each' tag must be a positive number between 1 and 4 digits")
        end
      end
      describe "with ordering" do
        it "should sort by the given by field" do
          pages(:home).should render('<r:testimonials:each limit="3" by="author"><r:author /> </r:testimonials:each>').as('Gene Smith Stephen Oster Vikram Khemani ')
        end
        it "should default sort by created_at" do
          pages(:home).should render('<r:testimonials:each limit="3"><r:author /> </r:testimonials:each>').as('Gene Smith Vikram Khemani Stephen Oster ')
        end
        it "should err with an invalid by field" do
          pages(:home).should render('<r:testimonials:each by="aoeu"><r:author /> </r:testimonials:each>').with_error("`by' attribute of `each' tag must be set to a valid field name")
        end
        it "should order by the given order field" do
          pages(:home).should render('<r:testimonials:each limit="3" by="author" order="desc"><r:author /> </r:testimonials:each>').as('Vikram Khemani Stephen Oster Gene Smith ')
        end
        it "should default order to ascending" do
          pages(:home).should render('<r:testimonials:each limit="3" by="author"><r:author /> </r:testimonials:each>').as('Gene Smith Stephen Oster Vikram Khemani ')
        end
        it "should err with an invalid order attribute" do
          pages(:home).should render('<r:testimonials:each order="123"><r:author /></r:testimonials:each>').with_error(%{`order' attribute of `each' tag must be set to either "asc" or "desc"})
        end
      end
      describe "author" do
        it "should display the author" do
          pages(:home).should render('<r:testimonials:each><r:author /> </r:testimonials:each>').as('Gene Smith Vikram Khemani Stephen Oster ')
        end
      end
      describe "author_title" do
        it "should display the author_title" do
          pages(:home).should render('<r:testimonials:each><r:author_title /> </r:testimonials:each>').as('  Founding Partner ')
        end
      end
      describe "content" do
        it "should display the project comment" do
          pages(:home).should render('<r:testimonials:each limit="1"><r:comment /></r:testimonials:each>').as("They're work is incredible!")
        end
      end
    end
  end
end
