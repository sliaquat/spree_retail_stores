Deface::Override.new(virtual_path: "spree/admin/shared/_head",
                     name: "pre_script_yield_added_to_head",
                     insert_before: "link",
                     partial: "spree/admin/shared/yield_pre_javascripts"
)
