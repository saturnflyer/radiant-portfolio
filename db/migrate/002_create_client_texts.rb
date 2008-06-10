class CreateClientTexts < ActiveRecord::Migration
  def self.up
    create_table :client_texts do |t|
      t.string :name
      t.text :content
      t.integer :client_id
      t.string :filter_id
      t.integer :created_by_id, :updated_by_id, :lock_version

      t.timestamps
    end
  end

  def self.down
    drop_table :client_texts
  end
end
