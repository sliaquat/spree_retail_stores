class CreateRetailStores < ActiveRecord::Migration
  def change
    create_table :retail_stores do |t|
      t.string :name
      t.string :timings
      t.references :address

      t.timestamps
    end
  end
end
