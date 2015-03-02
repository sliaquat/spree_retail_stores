Deface::Override.new(virtual_path: "spree/admin/shared/_head",
                     name: "googleapis_added_to_head",
                     insert_before: "link",
                     partial: "spree/admin/shared/google_maps_apis_javascript"
)
