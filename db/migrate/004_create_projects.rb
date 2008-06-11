class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.integer :client_id, :parent_id, :created_by_id, :updated_by_id, :lock_version
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
