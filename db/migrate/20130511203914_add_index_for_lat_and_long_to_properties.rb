class AddIndexForLatAndLongToProperties < ActiveRecord::Migration
  def self.up
    add_index :properties, [:latitude, :longitude]
  end

  def self.down
    remove_index :properties, [:latitude, :longitude]
  end
end
