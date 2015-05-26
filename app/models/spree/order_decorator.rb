Spree::Order.class_eval do


  def checkout_allowed?
    Time.zone =  Spree::Config[:store_time_zone]
    unless Spree::RetailStore.is_delvering_at_time?(Time.current)
      errors.add(:base, "Our store is currently closed. Please try again during our regular business hours.")
      return false
    end

    line_items.count > 0
  end

end