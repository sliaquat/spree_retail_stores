module Spree
  module Admin
    class RetailStoresController < ResourceController

      def new
          @retail_store = RetailStore.new
          @retail_store.address = Address.build_default
      end

      def index

      end


      def create

        byebug
        @retail_store = RetailStore.new(permitted_params)

      end


      private

      def permitted_params
        params.require(:retail_store).permit(:name, :timings, :address_attributes)
      end


    end
  end
end
