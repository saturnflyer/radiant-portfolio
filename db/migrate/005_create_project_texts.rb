class CreateProjectTexts < ActiveRecord::Migration
  def self.up
    create_table :project_texts do |t|
      t.integer :project_id
      t.string :name
      t.text :content
      t.string :filter_id
      t.integer :created_by_id, :updated_by_id, :lock_version

      t.timestamps
    end
    Radiant::Config['projects.defaults.project_text_name'] = 'description'
  end

  def self.down
    drop_table :project_texts
  end
end
