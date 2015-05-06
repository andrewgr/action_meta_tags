module ActionMetaTags
  module Tags
    class Meta
      def initialize(attrs, &block)
        @attrs    = attrs
        @renderer = block
      end

      def render(view, object)
        content = object.instance_exec(&renderer)
        view.tag(:meta, attrs.merge(content: content))
      end

      private

      attr_reader :renderer, :attrs
    end
  end
end
