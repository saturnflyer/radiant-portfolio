class ClientText < ActiveRecord::Base
  belongs_to :client
  belongs_to :created_by, :class_name => 'User'
  belongs_to :updated_by, :class_name => 'User'
end
