class Project < ActiveRecord::Base
  after_create :add_default_project_texts
  
  belongs_to :client
  has_many :project_texts, :dependent => :destroy
  belongs_to :created_by, :class_name => 'User'
  belongs_to :updated_by, :class_name => 'User'
  
  validates_presence_of :name
  validates_uniqueness_of :name, :scope => [:client_id, :parent_id]
  
  private
  
  def add_default_project_texts
    first_text = self.project_texts.build(:name => Radiant::Config['projects.defaults.project_text_name'])
    first_text.save!
  end
end
