module PortfolioTags
  include Radiant::Taggable

  class TagError < StandardError; end
  
  [:clients, :projects].each do |portfolio_model|
    single_model = portfolio_model.to_s.singularize
    tag "#{portfolio_model.to_s}" do |tag|
      tag.expand
    end
    tag "#{portfolio_model.to_s}:each" do |tag|
      model_class = portfolio_model.to_s.classify.constantize
      collection = model_class.find(:all, collection_find_options(tag, model_class.new))
      tag.locals.send("#{portfolio_model}=", collection)
      result = ''
      collection.each do |item|
        tag.locals.send("#{single_model}=", item)
        result <<  tag.expand
      end
      result
    end
    tag "#{portfolio_model.to_s}:each:name" do |tag|
      tag.locals.send("#{single_model}").send(:name)
    end
    tag "#{portfolio_model.to_s}:each:content" do |tag|
      text_type = single_model + "_text"
      tag.locals.send("#{single_model}").send(text_type+"s").find(:first, :conditions => ['name = ?', 'description']).content
    end
  end
  
  def collection_find_options(tag, model)
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
        
    by = (attr[:by] || 'created_at').strip
    order = (attr[:order] || 'asc').strip
    order_string = ''
    if model.attributes.keys.include?(by)
      order_string << by
    else
      raise TagError.new("`by' attribute of `each' tag must be set to a valid field name")
    end
    if order =~ /^(asc|desc)$/i
      order_string << " #{$1.upcase}"
    else
      raise TagError.new(%{`order' attribute of `each' tag must be set to either "asc" or "desc"})
    end
    options[:order] = order_string
    
    options
  end
  
end