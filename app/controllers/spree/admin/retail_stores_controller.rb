module Spree
  module Admin
    # class RetailStoresController < Spree::Admin::BaseController

    class RetailStoresController < ResourceController


      def new
        @retail_store = Spree::RetailStore.new
        @retail_store.address = Address.build_default
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
        params.require(:retail_store).permit(:name, :timings, address_attributes: [:firstname, :lastname, :address1, :address2, :city, :country_id, :zipcode, :state, :phone, :alternative_phone, :longitude, :latitude])
        # {"firstname"=>"Sanad", "lastname"=>"Liaquatt", "address1"=>"4163 Irvington Ave", "address2"=>"Apt 109", "city"=>"fremont",
        # "country_id"=>"232", "zipcode"=>"94538", "state"=>"California", "phone"=>"6305579771", "alternative_phone"=>"6305579771", "longitude"=>"124", "latitude"=>"3234"}
      end

    end
  end
end
