class Admin::ClientsController < ApplicationController
  
  only_allow_access_to :edit, :destroy,
    :when => [:admin],
    :denied_url => { :controller => 'clients', :action => 'index' },
    :denied_message => 'You must have administrator privileges to perform this action.'
    
  def index
    @clients = Client.find(:all)
    @client = Client.new
  end
  
  def create
    @client = Client.create(params[:client])
    if @client.save
      # @client.client_texts.build(:name => Radiant::Config['client.defaults.client_text_name'])
      flash[:notice] = "#{@client.name} was created!"
      redirect_to edit_admin_client_url(@client)
    else
      flash[:notice] = "The client could not be created."
      render :action => 'new'
    end
  end
  
  def edit
    @client = Client.find(params[:id])
    @client.client_texts.build if @client.client_texts.blank?
  end
  
  def update
    @client = Client.find(params[:id])
    if @client.update_attributes(params[:client])
      @client_text = @client.client_texts.find_or_create_by_name(params[:client_text][:name])
      @client_text.update_attributes(params[:client_text])
      flash[:notice] = "Changes for #{@client.name} were saved."
      if params[:commit] == "Save and Continue Editing"
        redirect_to edit_admin_client_url(@client)
      else
        redirect_to admin_clients_url
      end
    else
      flash[:notice] = "Sorry, we couldn't save the changes."
      render :action => 'edit'
    end
  end
  
  def destroy
    @client = Client.find(params[:id])
    @name = @client.name
    if @client.destroy
      flash[:notice] = "#{@name} was deleted."
      redirect_to admin_clients_url
    else
      flash[:notice] = "#{@name} could not be deleted"
      redirect_to admin_clients_url
    end
  end
end
