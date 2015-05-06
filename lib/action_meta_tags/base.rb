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

      %i(keywords description).each do |method_name|
        define_method method_name do |&block|
          tags << Tags::Meta.new(name: method_name, &block)
        end
      end

      [
        'og:title',
        'og:image',
        'og:description'
      ].each do |property_name|
        define_method property_name.gsub(':', '_') do |&block|
          tags << Tags::Meta.new(property: property_name, &block)
        end
      end
    end

    def render(view)
      html = self.class.tags.map { |tag| tag.render(view, @object) }.join("\n")
      view.raw(html)
    end
  end
end
