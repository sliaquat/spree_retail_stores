class CreateSpreeRetailStores < ActiveRecord::Migration
  def change
    create_table :spree_retail_stores do |t|
      t.string :name
      t.string :timings
      t.references :address

      t.timestamps
    end
  end
end
