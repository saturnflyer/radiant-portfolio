class CreateTestimonials < ActiveRecord::Migration
  def self.up
    create_table :testimonials do |t|
      t.text :comment
      t.string :author, :author_title
      t.timestamps
    end
    add_index :testimonials, :author
    
    create_table :project_testimonials do |t|
      t.integer :project_id
      t.integer :testimonial_id
    end
    add_index :project_testimonials, [:project_id, :testimonial_id], :unique => true
    
    create_table :client_testimonials do |t|
      t.integer :client_id
      t.integer :testimonial_id
    end
    add_index :client_testimonials, [:client_id, :testimonial_id], :unique => true
  end

  def self.down
    remove_index :client_testimonials, :column => [:client_id, :testimonial_id]
    drop_table :client_testimonials
    
    remove_index :project_testimonials, :column => [:project_id, :testimonial_id]
    drop_table :project_testimonials
    
    remove_index :testimonials, :author
    drop_table :testimonials
  end
end
