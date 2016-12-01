module Website
  module Ext
    module ActiveRecord
      module I18n
        extend ActiveSupport::Concern
        I18N_ATTR_PREFIX = /^i18n_attr_/
        NAME_OF_PREFIX = /^name_of_/
        def method_missing(method, *args, &block)
          c = method.to_s
          col = c.sub(I18N_ATTR_PREFIX,'')
          if c =~ I18N_ATTR_PREFIX 
            col = c.sub(I18N_ATTR_PREFIX,'')
            display_model_status(self.class, col, self.send(col.to_sym)) if self.class.column_names.include?(col)
          elsif c =~ NAME_OF_PREFIX 
            col = c.sub(NAME_OF_PREFIX,'')
            eval("#{self.class.name}::#{col.upcase}.invert[self.#{col}]") if eval("#{self.class.name}.constants.include?(:#{col.upcase})")
          else
            super
          end
        end

        def display_model_status(model,attribute,value)
          return if value.nil?
          if ['active'].include?(attribute.to_s.strip)
            s = ::I18n.t("activerecord.status.#{attribute}.#{value}", default: value)
          else
            s = ::I18n.t("activerecord.status.#{model.name.underscore}.#{attribute}.#{value}", default: value)
            # I18n.backend.translate('en', 'activerecord.status.order_detail.detail_status')
          end
          s
        end
      end
    end
  end
end
