module Spree
  module Admin
    # class RetailStoresController < Spree::Admin::BaseController

    class RetailStoresController < ResourceController


      def new
        @retail_store = Spree::RetailStore.new
      end
      #
      def index
        @retails_stores = Spree::RetailStore.all
      end
      #
      # def edit
      #
      # end
      #
      # def update
      #
      # end
      #
      # def destroy
      #
      # end
      #
      #
      #
      #
      def create

        byebug
        @retail_store = Spree::RetailStore.new(permitted_params)


        if(@retail_store.save)
          redirect_to admin_retail_stores_path
        else
          render 'new'
        end

      end
      #
      #
      # private
      #
      def permitted_params
        params.require(:retail_store).permit(:store_name, :timings, :address1, :address2, :city, :country, :zipcode, :state, :phone, :alternative_phone, :longitude, :latitude)

      end

    end
  end
end
