Deface::Override.new(
  virtual_path:   'spree/admin/shared/_order_submenu',
  name:           'print_invoice_order_tab_links',
  insert_bottom:  '[data-hook="admin_order_tabs"], #admin_order_tabs[data-hook]',
  partial:        'spree/admin/orders/print_invoice_order_tab_links'
)