class Admin::ProjectsController < ApplicationController
  before_filter :load_client
  
  only_allow_access_to :edit, :destroy,
    :when => [:admin],
    :denied_url => { :controller => 'clients', :action => 'index' },
    :denied_message => 'You must have administrator privileges to perform this action.'
    
  def index
    @projects = @client.projects
  end
  
  def new
    @project = @client.projects.build()
    @project.project_texts.build()
  end
  
  def edit
    @project = @client.projects.find(params[:id])
  end
  
  def update
    @project = @client.projects.find(params[:id])
    logger.debug params[:project]
    if @project.update_attributes(params[:project])
      text = params[:project_text]
      @project.project_texts.find_by_name(text[:name]).update_attributes(text)
      if params[:commit] == "Save and Continue Editing"
        redirect_to edit_admin_client_project_url(@client, @project)
      else
        redirect_to admin_portfolio_url
      end
    else
      render :action => 'edit'
    end
  end
  
  def create
    @project = @client.projects.build(params[:project])
    if @project.save
      # @project.project_texts.build(:name => Radiant::Config['projects.defaults.project_text_name'])
      flash[:notice] = "#{@project.name} was created!"
      redirect_to edit_admin_client_url(@client)
    else
      flash[:notice] = "The project could not be created."
      render :action => 'new'
    end
  end
  
  def destroy
    @project = @client.projects.find(:id)
    @project.destroy
    redirect_to admin_clients_path
  end
  
  private
  
  def load_client
    @client = Client.find(params[:client_id])
  end
end
