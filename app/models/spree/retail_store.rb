module Spree
  class RetailStore < ActiveRecord::Base

    belongs_to :address, class_name: 'Spree::Address'
    accepts_nested_attributes_for :address, :allow_destroy => true

  end
end
