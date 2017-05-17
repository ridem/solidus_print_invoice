module SolidusPrintInvoice
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'solidus_print_invoice'

    config.autoload_paths += %W(#{config.root}/lib)

    initializer 'spree.print_invoice.environment', before: :load_config_initializers, after: 'spree.backend.environment' do
      Spree::PrintInvoice::Config = Spree::PrintInvoiceSetting.new
      Spree::Backend::Config.configure do |config|
        config.menu_items.push(
          config.class::MenuItem.new(
            [:bookkeeping_documents],
            'file-text',
            partial: 'spree/admin/shared/documents_sub_menu',
            condition: -> { can?(:show, Spree::Order) },
          )
        )
      end
    end

    class << self
      def activate
        cache_klasses = %W(#{config.root}/app/**/*_decorator*.rb)
        Dir.glob(cache_klasses) do |klass|
          Rails.configuration.cache_classes ? require(klass) : load(klass)
        end
      end
    end

    config.to_prepare(&method(:activate).to_proc)
  end
end
