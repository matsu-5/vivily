class CreateCustomerMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_messages do |t|
      t.integer :room_id
      t.integer :submit_user_id
      t.text :body
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
