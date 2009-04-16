# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class PortfolioExtension < Radiant::Extension
  version "1.0"
  description "Allows you to track clients and the results of completed projects"
  url "http://saturnflyer.com/"
  
  define_routes do |map|
    map.namespace(:admin) do |admin|
      admin.portfolio "/portfolio", :controller => 'clients', :conditions => {:method => :get}
      admin.resources :clients, :member => {:add_text => :post} do |clients|
        clients.resources :client_texts
        clients.resources :projects do |projects|
          projects.resources :project_texts
        end
      end
    end
  end
  
  def activate
    # connect UserActionObserver with my models 
    UserActionObserver.instance.send :add_observer!, Client 
    UserActionObserver.instance.send :add_observer!, ClientText 
    UserActionObserver.instance.send :add_observer!, Project 
    UserActionObserver.instance.send :add_observer!, ProjectText 
    admin.tabs.add "Portfolio", "/admin/portfolio", :after => "Layouts", :visibility => [:all]
  end
  
  def deactivate
    admin.tabs.remove "Portfolio"
  end
  
end