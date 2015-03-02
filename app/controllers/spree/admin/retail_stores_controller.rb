module Spree
  module Admin
    class RetailStoresController < Spree::Admin::BaseController

      def new
          @retail_store = RetailStore.new
          @retail_store.address = Address.build_default
      end

      def index

      end


      def create

      end


    end
  end
end
