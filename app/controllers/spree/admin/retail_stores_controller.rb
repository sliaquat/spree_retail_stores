module Spree
  module Admin

    class RetailStoresController < ResourceController


      def new
        @retail_store = Spree::RetailStore.new
      end

      def index
        @retails_stores = Spree::RetailStore.all
      end

      def edit
        @retail_store = Spree::RetailStore.find(params[:id])
      end

      def update
        @retail_store = Spree::RetailStore.find(params[:id])
        # spree_country= Spree::Country.find(permitted_params[:country]).name
        if(@retail_store.update_attributes(permitted_params))
          flash[:success] = "Retail Store Updated"
          redirect_to admin_retail_stores_path
        else
          render 'edit'
        end

      end
      #
      def destroy
        Spree::RetailStore.find(params[:id]).destroy
        flash[:success] = "Retail Store Deleted"
        redirect_to admin_retail_stores_path
      end

      def create

        # spree_country= Spree::Country.find(permitted_params[:country]).name

        @retail_store = Spree::RetailStore.new(permitted_params)

        if(@retail_store.save)
          flash[:success] = "Retail Store Created"
          redirect_to admin_retail_stores_path
        else
          render 'new'
        end

      end

        # private
        def permitted_params
          params.require(:retail_store).permit(:id, :store_name, :timings, :address1, :address2, :city, :country, :zipcode, :state, :phone, :email, :longitude, :latitude)

        end

    end
  end
end
