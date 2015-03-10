Deface::Override.new(virtual_path: "spree/admin/shared/sub_menu/_configuration",
                     name: "retail_stores_added_to_configuration_menu",
                     insert_bottom: "[data-hook='admin_configurations_sidebar_menu']",
                     partial: "spree/admin/shared/retail_store_settings"
)
