class AddUseTimingsForDeliveryToRetailStores < ActiveRecord::Migration
  def change
    add_column :spree_retail_stores, :use_timings_for_delivery, :boolean, default: false
  end
end
