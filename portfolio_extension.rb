# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class PortfolioExtension < Radiant::Extension
  version "1.0"
  description "Allows you to track clients and the results of completed projects"
  url "http://saturnflyer.com/"
  
  define_routes do |map|
    map.namespace(:admin) do |admin|
      admin.portfolio "/portfolio", :controller => 'clients', :conditions => {:method => :get}
      admin.resources :clients, :has_many => :client_texts, :member => {:add_text => :post}
    end
  end
  
  def activate
    # join already observed models with portforlio extension models 
    observables = UserActionObserver.instance.observed_classes | [Client, ClientText] 

    # update list of observables 
    UserActionObserver.send :observe, observables 

    # connect UserActionObserver with my models 
    UserActionObserver.instance.send :add_observer!, Client 
    UserActionObserver.instance.send :add_observer!, ClientText 
    admin.tabs.add "Portfolio", "/admin/portfolio", :after => "Layouts", :visibility => [:all]
  end
  
  def deactivate
    admin.tabs.remove "Portfolio"
  end
  
end