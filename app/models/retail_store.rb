class RetailStore < ActiveRecord::Base

  belongs_to :address, class_name: 'Spree::Address',   inverse_of: :retail_store
end
