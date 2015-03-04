class CreateSpreeRetailStores < ActiveRecord::Migration
  def change
    create_table :spree_retail_stores do |t|
      t.string :store_name
      t.string :timings

      t.string :address1
      t.string :address2
      t.string :city
      t.string :country
      t.string :zipcode
      t.string :state
      t.string :phone
      t.string :email
      t.decimal :longitude
      t.decimal :latitude

      t.timestamps
    end
  end
end
