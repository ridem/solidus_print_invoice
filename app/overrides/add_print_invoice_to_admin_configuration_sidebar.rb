Deface::Override.new(
  virtual_path:  'spree/admin/shared/configuration_menu',
  name:          'print_invoice_admin_configurations_menu',
  insert_bottom: '[data-hook="admin_configurations_sidebar_menu"]',
  text:          '<%= settings_tab_item Spree.t(:settings, scope: :print_invoice),
                      edit_admin_print_invoice_settings_path %>'
)
