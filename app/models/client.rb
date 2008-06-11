class Client < ActiveRecord::Base
  after_create :add_default_client_texts
  
  has_many :client_texts, :dependent => :destroy
  has_many :projects, :dependent => :destroy
  belongs_to :created_by, :class_name => 'User'
  belongs_to :updated_by, :class_name => 'User'
  
  validates_uniqueness_of :name
  
  private
  
  def add_default_client_texts
    first_text = self.client_texts.build(:name => Radiant::Config['clients.defaults.client_text_name'])
    first_text.save!
  end
end
