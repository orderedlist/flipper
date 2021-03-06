module Flipper
  module Gates
    class PercentageOfRandom < Gate
      Key = :perc_time

      def type_key
        Key
      end

      def open?(actor)
        percentage = toggle.value

        if percentage.nil?
          false
        else
          rand < (percentage / 100.0)
        end
      end

      def protects?(thing)
        thing.is_a?(Flipper::Types::PercentageOfRandom)
      end
    end
  end
end
