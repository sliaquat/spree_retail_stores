module Spree
  module Api
    class RetailStoresController < Spree::Api::BaseController

      before_action :set_time_zone

      def set_time_zone
        Time.zone =  Spree::Config[:store_time_zone];
      end

      def index
        @retails_stores = Spree::RetailStore.all

        respond_with(@retails_stores)
      end


    end
  end
end
