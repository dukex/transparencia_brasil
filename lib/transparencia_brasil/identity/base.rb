module TransparenciaBrasil
  module Identity
    class Base
      # Define methods that retrieve the value from an initialized instance variable Hash, using the attribute as a key
      #
      # @param attrs [Array, Set, Symbol]
      def self.attr_reader(*attrs)
        mod = Module.new do
          attrs.each do |attribute|
            define_method attribute do
              @attrs[attribute.to_s]
            end
          end
        end
        include mod
      end

      # Initializes a new object
      #
      # @param attrs [Hash]
      def initialize(attrs={})
        @attrs = attrs
      end
    end
  end
end
