Spree::LineItem.class_eval do

  validate :ensure_store_is_delivering_now, :on => :create

  def ensure_store_is_delivering_now
    Time.zone =  Spree::Config[:store_time_zone]

    unless Spree::RetailStore.is_delvering_at_time?(Time.current)
      errors.add(:base, "Our store is currently closed. Please try again during our regular business hours.")
    end
  end
end
