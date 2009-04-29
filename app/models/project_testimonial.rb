class ProjectTestimonial < ActiveRecord::Base
  has_one :project
  has_one :testimonial
end