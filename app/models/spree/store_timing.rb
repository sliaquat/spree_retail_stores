class Spree::StoreTiming < ActiveRecord::Base
  belongs_to :retail_store, class_name: "Spree::RetailStore"

end
