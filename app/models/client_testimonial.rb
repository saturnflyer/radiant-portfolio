class ClientTestimonial < ActiveRecord::Base
  has_one :client
  has_one :testimonial
end