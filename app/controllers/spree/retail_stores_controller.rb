module Spree


    class RetailStoresController <  Spree::StoreController
      before_action :set_time_zone

      def set_time_zone
        Time.zone =  Spree::Config[:store_time_zone];
      end


      def index
        @retails_stores = Spree::RetailStore.all
      end

    end

end
