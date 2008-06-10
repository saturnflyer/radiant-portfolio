class Admin::ClientTextsController < ApplicationController
  def create
    client_text = ClientText.new(params[:client_text])
    @index = params[:index].to_i if params[:index]
        render(:partial => 'admin/client_texts/client_text.html.erb', :object => client_text, :layout => false)
  end
end