Spree::CheckoutController.class_eval do

  def ensure_checkout_allowed
    unless @order.checkout_allowed?
      flash[:error] = @order.errors.full_messages.join("\n")
      redirect_to spree.cart_path
    end
  end

end