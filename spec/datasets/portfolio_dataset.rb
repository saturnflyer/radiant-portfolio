class PortfolioDataset < Dataset::Base
  uses :users
  
  def load
    create_client 'Saturn Flyer'
    create_client 'Ignite Social Media' do
      create_project 'ignite website'
    end
    create_client 'Kratos Defense' do
      create_project 'iris'
    end
    create_client 'Smithsonian' do
      create_project 'invertebrates'
    end
    create_client 'Bright Yellow Jacket' do
      create_project 'byj site'
    end
  end
  
  def create_client(name, text = nil)
    create_record :client, name.symbolize, :name => name do
      unless text.blank?
        create_record :client_text, 'description', :content => text
      end
    end
    if block_given?
      @client_id = client_id(name.symbolize)
      yield
    end
  end
  
  def create_project(name, text = nil)
    create_record :project, name.symbolize, :name => name do
      unless text.blank?
        create_record :project_text, 'description', :content => text, :client_id => @client_id
      end
    end
  end
end