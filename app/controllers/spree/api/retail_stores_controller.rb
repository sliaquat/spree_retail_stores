module Spree
  module Api
    class RetailStoresController < Spree::Api::BaseController

      def index
        @retails_stores = Spree::RetailStore.all

        respond_with(@retails_stores)
      end


    end
  end
end
