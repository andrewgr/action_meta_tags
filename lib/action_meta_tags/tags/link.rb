module ActionMetaTags
  module Tags
    class Link
      def initialize(attrs, &block)
        @attrs    = attrs
        @renderer = block
      end

      def render(view, object)
        href = object.instance_exec(&renderer)
        view.tag(:link, attrs.merge(href: href))
      end

      private

      attr_reader :renderer, :attrs
    end
  end
end
