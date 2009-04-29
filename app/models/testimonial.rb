class Testimonial < ActiveRecord::Base
  validates_presence_of :comment, :author
  
  belongs_to :client_testimonial
  belongs_to :project_testimonial
end
