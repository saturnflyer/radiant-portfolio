module PortfolioTags
  include Radiant::Taggable
  
  [:clients, :projects].each do |portfolio_model|
    tag "#{portfolio_model.to_s}" do |tag|
      tag.expand
    end
    tag "#{portfolio_model.to_s}:each" do |tag|
      collection = portfolio_model.to_s.classify.constantize.find(:all)
      tag.locals.send("#{portfolio_model}=", collection)
      result = ''
      collection.each do |item|
        tag.locals.send("#{portfolio_model.to_s.singularize}=", item)
        result <<  tag.expand
      end
      result
    end
  end
  
end