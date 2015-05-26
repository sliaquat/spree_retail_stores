Spree::Api::CheckoutsController.class_eval do

  before_action :ensure_checkout_allowed, only: :next

  def ensure_checkout_allowed
    unless @order.checkout_allowed?
      respond_with(@order, default_template: 'spree/api/orders/could_not_transition', status: 422)
    end
  end

end
