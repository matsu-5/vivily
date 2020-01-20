class CreateDisks < ActiveRecord::Migration[5.2]
  def change
    create_table :disks do |t|
      t.integer :disc_id
      t.integer :disk_order

      t.timestamps
    end
  end
end
