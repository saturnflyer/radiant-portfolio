require File.dirname(__FILE__) + '/../spec_helper'

describe Page do
  dataset :pages, :portfolio

  describe "clients" do
    it "should expand it's contents" do
      pages(:home).should render('<r:clients>text</r:clients>').as('text')
    end
    describe "each" do
      it "should expand it's contents for each client" do
        pages(:home).should render('<r:clients:each>text </r:clients:each>').as('text text text text text ')
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
    end
  end
end
