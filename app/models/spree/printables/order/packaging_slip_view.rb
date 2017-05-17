module Spree
  class Printables::Order::PackagingSlipView < Printables::Order::InvoiceView
    delegate :number, to: :printable

    def after_save_actions; end
  end
end
