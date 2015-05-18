object @retails_store
attributes :id, :store_name, :address1, :address2, :city, :country, :zipcode, :state, :phone, :email, :longitude, :latitude

child :store_timings => :store_timings do
  attributes :id, :day_of_week, :opening_time, :closing_time, :closed
end
