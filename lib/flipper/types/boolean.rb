module Flipper
  module Types
    class Boolean < Type
      def enabled_value
        true
      end

      def disabled_value
        false
      end
    end
  end
end
