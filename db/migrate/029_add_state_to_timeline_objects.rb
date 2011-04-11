class AddStateToTimelineObjects < ActiveRecord::Migration
  def self.up
    add_column :comments, :state, :string, :limit => 16, :null => false, :default => "Expanded"
    add_column :emails,   :state, :string, :limit => 16, :null => false, :default => "Expanded"
    Comment.reset_column_information
    Email.reset_column_information
    Comment.update_all("state = 'Expanded'")
    Email.update_all("state = 'Expanded'")
  end

  def self.down
    remove_column :comments, :state
    remove_column :emails,   :state
  end
end
