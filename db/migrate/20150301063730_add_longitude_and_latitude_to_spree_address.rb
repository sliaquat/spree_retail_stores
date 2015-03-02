class AddLongitudeAndLatitudeToSpreeAddress < ActiveRecord::Migration
  def change
    add_column :spree_addresses, :longitude, :string
    add_column :spree_addresses, :latitude, :string
  end
end
