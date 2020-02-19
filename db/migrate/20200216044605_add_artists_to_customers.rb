class AddArtistsToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :artist, :string
    add_column :customers, :genre, :string
    add_column :customers, :live, :text
    add_column :customers, :profile_image_id, :string
  end
end
