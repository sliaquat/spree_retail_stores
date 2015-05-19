class RemoveTimingsFieldFromRetailStores < ActiveRecord::Migration
  def up
    remove_column :spree_retail_stores, :timings, :string
  end

  def down
    add_column :spree_retail_stores, :timings, :string
  end
end
