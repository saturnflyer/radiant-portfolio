module PortfolioTags
  include Radiant::Taggable

  class TagError < StandardError; end
  
  [:clients, :projects].each do |portfolio_model|
    tag "#{portfolio_model.to_s}" do |tag|
      tag.expand
    end
    tag "#{portfolio_model.to_s}:each" do |tag|
      collection = portfolio_model.to_s.classify.constantize.find(:all, collection_find_options(tag))
      tag.locals.send("#{portfolio_model}=", collection)
      result = ''
      collection.each do |item|
        tag.locals.send("#{portfolio_model.to_s.singularize}=", item)
        result <<  tag.expand
      end
      result
    end
    tag "#{portfolio_model.to_s}:each:name" do |tag|
      tag.locals.send("#{portfolio_model.to_s.singularize}").send(:name)
    end
  end
  
  def collection_find_options(tag)
    attr = tag.attr.symbolize_keys
    
    options = {}

    [:limit, :offset].each do |symbol|
      if number = attr[symbol]
        if number =~ /^\d{1,4}$/
          options[symbol] = number.to_i
        else
          raise TagError.new("`#{symbol}' attribute of `each' tag must be a positive number between 1 and 4 digits")
        end
      end
    end
    
    options
  end
  
end