module Spree
  class RetailStore < ActiveRecord::Base
    validates :store_name, :address1, :city, :country, :zipcode, :phone, :longitude, :latitude, presence: true

    validates :longitude, :latitude, numericality: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, format: {with: VALID_EMAIL_REGEX}, unless: "email.nil?"

  end
end
