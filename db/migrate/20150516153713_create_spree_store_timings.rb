class CreateSpreeStoreTimings < ActiveRecord::Migration
  def change
    create_table :spree_store_timings do |t|
      t.references :retail_store
      t.datetime :day_of_week
      t.datetime :opening_time
      t.datetime :closing_time
      t.boolean :closed, default: false
      t.timestamps null: false
    end
  end
end
