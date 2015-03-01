class AddLongitudeAndLatitudeToSpreeAddress < ActiveRecord::Migration
  def change
    add_column :longitude, :spree_addresses, :string
    add_column :latitude, :spree_addresses, :string
  end
end
