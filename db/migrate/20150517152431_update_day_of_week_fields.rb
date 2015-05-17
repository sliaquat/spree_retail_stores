class UpdateDayOfWeekFields < ActiveRecord::Migration
  def change
    remove_column :spree_store_timings, :day_of_week
    add_column :spree_store_timings, :day_of_week, :string
  end
end
