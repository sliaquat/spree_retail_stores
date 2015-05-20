Deface::Override.new(:virtual_path => "spree/shared/_main_nav_bar",
                     :name => "add_store_locations_header_nav",
                     :insert_after => "#shop-by",
                     :text => %! <%if Spree::RetailStore.any?%><li id="store_locations-link" data-hook><%= link_to "Store Locations", retail_stores_path %></li> <%end%>!
)