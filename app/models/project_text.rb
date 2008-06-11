class ProjectText < ActiveRecord::Base
  belongs_to :project
  belongs_to :created_by, :class_name => 'User'
  belongs_to :updated_by, :class_name => 'User'
  
  validates_uniqueness_of :name, :scope => :project_id
end
