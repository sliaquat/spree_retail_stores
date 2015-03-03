module Spree
  class RetailStore < ActiveRecord::Base
    validates :store_name, :address1, :city, :country, :zipcode, :phone, :longitude, :latitude, presence: true

    validates :longitude, :latitude, numericality: true
  end
end
