class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :name
      t.integer :bedroom_count
      t.float :latitude
      t.float :longitude
      t.string :address

      t.timestamps
    end
  end
end
