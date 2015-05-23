module Spree
  class RetailStore < ActiveRecord::Base
    has_many :store_timings
    accepts_nested_attributes_for :store_timings

    validates :store_name, :address1, :city, :country, :zipcode, :phone, :longitude, :latitude, presence: true

    validates :longitude, :latitude, numericality: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, format: {with: VALID_EMAIL_REGEX}, unless: "email.nil?"

    after_update :update_use_timings_for_other_records, :if => :use_timings_for_delivery_changed?

    def self.store_for_delivery
      self.find_by(use_timings_for_delivery: true)
    end


    def self.delivery_timings_for_day(day = Time.current)
      Time.zone = Spree::Config[:store_time_zone];


      if (store_for_delivery)
        days_timings = self.store_for_delivery.store_timings.find_by(day_of_week: day.strftime("%A"))
        return {opening_time: days_timings.closed ? nil : days_timings.opening_time_adjusted_to_day(day), closing_time: days_timings.closed ? nil : days_timings.closing_time_adjusted_to_day(day), use_delivery_timings: true}
      end
      return {opening_time: nil, closing_time: nil, use_delivery_timings: false}
    end

    def self.is_delvering_at_time?(time)
      Time.zone = Spree::Config[:store_time_zone];
      delivery_timings_for_this_day = self.delivery_timings_for_day(time)
      delivery_timings_for_day_before = self.delivery_timings_for_day(time-(24*60*60))
      if delivery_timings_for_this_day[:use_delivery_timings]
        time_falls_in_todays_delivery_time = delivery_timings_for_this_day[:opening_time] && delivery_timings_for_this_day[:closing_time] && time >= delivery_timings_for_this_day[:opening_time] && time <= delivery_timings_for_this_day[:closing_time]
        time_falls_in_yesterdays_delivery_time = delivery_timings_for_day_before[:opening_time] && delivery_timings_for_day_before[:closing_time] && time >= delivery_timings_for_day_before[:opening_time] && time <= delivery_timings_for_day_before[:closing_time]
        return time_falls_in_todays_delivery_time || time_falls_in_yesterdays_delivery_time
      end


      return true # always deliver when no store is set for delivery
    end


    def full_address
      full_address = []
      full_address << address1 << address2 << city << state << country << zipcode
      full_address.reject { |item| item == "" }.join(" ")
    end

    def update_use_timings_for_other_records
      if (self.use_timings_for_delivery?)
        Spree::RetailStore.where("id != :this_id", {:this_id => self.id}).update_all(use_timings_for_delivery: false)
      end
    end

    def timing_string_for_day(day_of_week)
      store_t = store_timings.find_by(day_of_week: day_of_week)
      return nil unless store_t

      if store_t.closed
        return "CLOSED"
      elsif (store_t.opening_time && store_t.closing_time)
        return "#{store_t.opening_time.strftime('%l:%M %p')} to #{store_t.closing_time.strftime('%l:%M %p')}"
      else
        return "NA"
      end


    end


    def html_info

      "
      <style>td {padding-right: 10px;}</style>
      <h3>#{store_name}</h3>
      <strong>Address: </strong>#{address1 + " " + address2 + " " + city + " " + zipcode + " " + country}<br/>
      <strong>Phone: </strong>#{phone}
      <br/><br/>
      <table >
      <tr><td><strong>SATURDAY:</strong></td><td>#{timing_string_for_day('Saturday')}</td></tr>
      <tr><td><strong>SUNDAY:</strong></td><td>#{timing_string_for_day('Sunday')}</td></tr>
      <tr><td><strong>MONDAY:</strong></td><td>#{timing_string_for_day('Monday')}</td> </tr>
      <tr><td><strong>TUESDAY:</strong></td><td>#{timing_string_for_day('Tuesday')} </td></tr>
      <tr><td><strong>WEDNESDAY:</strong></td><td>#{timing_string_for_day('Wednesday')} </td></tr>
      <tr><td><strong>THURSDAY:</strong></td><td>#{timing_string_for_day('Thursday')}</td></tr>
      <tr><td><strong>FRIDAY:</strong></td><td>#{timing_string_for_day('Friday')}</td></tr>
      </table>
      ".gsub("\n", '').html_safe.to_s
    end

  end

end
