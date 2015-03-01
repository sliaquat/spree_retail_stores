Deface::Override.new(virtual_path: "spree/admin/shared/_configuration_menu",
                     name: "retail_stores_added_to_configuration_menu",
                     insert_bottom: ".sidebar",
                     partial: "spree/admin/shared/retail_store_settings"
)
