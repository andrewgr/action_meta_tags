module ActionMetaTags
  class Base
    def initialize(object)
      @object = object
    end

    class << self
      def tags
        @tags ||= []
      end

      def title(&block)
        tags << Tags::Title.new(&block)
      end

      def meta(attrs, &block)
        tags << Tags::Meta.new(attrs, &block)
      end

      %w(keywords description).each do |method|
        define_method method do |&block|
          tags << meta(name: method, &block)
        end
      end

      [
        'og:title',
        'og:image',
        'og:description'
      ].each do |property|
        method = property.gsub(':', '_')

        define_method method do |&block|
          tags << meta(property: property, &block)
        end
      end
    end

    def render(view)
      html = self.class.tags.map { |tag| tag.render(view, @object) }.join("\n")
      view.raw(html)
    end
  end
end
