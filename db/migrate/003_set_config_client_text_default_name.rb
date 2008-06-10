class SetConfigClientTextDefaultName < ActiveRecord::Migration
  def self.up
    Radiant::Config['clients.defaults.client_text_name'] = 'description'
  end
  
  def self.down
  end
end