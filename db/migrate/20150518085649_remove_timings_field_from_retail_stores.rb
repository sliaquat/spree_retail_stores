class RemoveTimingsFieldFromRetailStores < ActiveRecord::Migration
  def change
    remove_column :spree_retail_stores, :timings
  end
end
