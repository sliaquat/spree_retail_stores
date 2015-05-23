class Spree::StoreTiming < ActiveRecord::Base
  belongs_to :retail_store, class_name: "Spree::RetailStore"

  before_validation :correct_dates

  def correct_dates # if closing time is after midnight and the difference between opening time and closing time is less than 24 hours, then move closing time to next day.
    #e.g. opeining time: 10:00 am and closing time: 2:00 am

    self.closing_time = adjust_closing_time(self.opening_time, self.closing_time)

  end



  def adjust_closing_time(o_time, c_time)
    Time.zone =  Spree::Config[:store_time_zone];
    if(o_time && c_time)

      if(o_time > c_time)
        if(((c_time + (24 * 60 * 60)) - o_time) < (24 * 60 * 60))
          c_time = c_time +  (24 * 60 * 60)
        end
      end

    end
    return c_time
  end

  def opening_time_adjusted_to_day(day)
    Time.zone =  Spree::Config[:store_time_zone];

    day.change({ hour: self.opening_time.hour, min: self.opening_time.min, sec: 0 })
  end

  def closing_time_adjusted_to_day(day)
    Time.zone =  Spree::Config[:store_time_zone];
    ct= day.change({ hour: self.closing_time.hour, min: self.closing_time.min, sec: 0 })

    return adjust_closing_time(self.opening_time_adjusted_to_day(day), ct)
  end

end

