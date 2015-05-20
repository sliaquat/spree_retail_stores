module Spree
  class RetailStore < ActiveRecord::Base
    has_many :store_timings
    accepts_nested_attributes_for :store_timings

    validates :store_name, :address1, :city, :country, :zipcode, :phone, :longitude, :latitude, presence: true

    validates :longitude, :latitude, numericality: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, format: {with: VALID_EMAIL_REGEX}, unless: "email.nil?"

    def timing_string_for_day(day_of_week)
      store_t = store_timings.find_by(day_of_week:day_of_week)
      return nil unless store_t

      if store_t.closed
        return "CLOSED"
      else
        return "#{store_t.opening_time.strftime('%l:%M %p')} to #{store_t.closing_time.strftime('%l:%M %p')}"
      end


    end


    def html_info

      "
      <style>td {padding-right: 10px;}</style>
      <h3>#{store_name}</h3>
      <strong>Address: </strong>#{address1 + " " + address2 + " "  + city + " "  + zipcode + " "  + country}<br/>
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
