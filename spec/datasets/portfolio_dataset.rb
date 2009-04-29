class PortfolioDataset < Dataset::Base
  uses :pages, :users
  
  def load
    create_client 'Saturn Flyer', 'designers and developers'
    create_client 'Ignite Social Media', 'original' do
      create_testimonial "They're work is incredible!", 'Gene Smith'
      create_project 'ignite website', 'moving to Radiant'
    end
    create_client 'Kratos Defense', 'strength to success' do
      create_project 'iris', 'tracking users and deployments' do
        create_testimonial 'We use IRIS more and more every day.', 'Vikram Khemani'
      end
    end
    create_client 'Smithsonian', 'increase & diffusion of knowledge' do
      create_project 'invertebrates', 'updating website'
    end
    create_client 'Bright Yellow Jacket', 'stand apart' do
      create_project 'byj site', 'developing website' do
        create_testimonial 'We are very happy with this project', 'Stephen Oster', 'Founding Partner'
      end
    end
  end
  
  def create_client(name, text = nil)
    create_record :client, name.symbolize, :name => name
    unless text.blank?
      create_record :client_text, :name => 'description', :content => text, :client_id => client_id(name.symbolize)
    end
    if block_given?
      @client_id = client_id(name.symbolize)
      yield
    end
  end
  
  def create_project(name, text = nil)
    create_record :project, name.symbolize, :name => name, :client_id => @client_id
    unless text.blank?
      create_record :project_text, :name => 'description', :content => text, :project_id => project_id(name.symbolize)
    end
    if block_given?
      @project_id = project_id(name.symbolize)
      yield
    end
  end
  
  def create_testimonial(comment, author, author_title = nil)
    create_record :testimonial, author.symbolize, :author => author, :comment => comment, :author_title => author_title
    if !@project_id.blank?
      create_record :project_testimonial, :testimonial_id => testimonial_id(author.symbolize), :project_id => @project_id
    elsif !@client_id.blank?
      create_record :client_testimonial, :testimonial_id => testimonial_id(author.symbolize), :client_id => @client_id
    end
  end
end