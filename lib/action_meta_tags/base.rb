module ActionMetaTags
  class Base
    def initialize(object)
      @object = object
    end

    def self.title(&block)
      tags << Tags::Title.new(&block)
    end

    def self.meta(attrs, &block)
      tags << Tags::Meta.new(attrs, &block)
    end

    def self.keywords(&block)
      tags << Tags::Meta.new(name: 'keywords', &block)
    end

    def self.description(&block)
      tags << Tags::Meta.new(name: 'description', &block)
    end

    def self.og_title(&block)
      tags << Tags::Meta.new(property: 'og:title', &block)
    end

    def self.og_image(&block)
      tags << Tags::Meta.new(property: 'og:image', &block)
    end

    def self.og_description(&block)
      tags << Tags::Meta.new(property: 'og:description', &block)
    end

    def self.tags
      @tags ||= []
    end

    def render(view)
      html = self.class.tags.map { |tag| tag.render(view, @object) }.join("\n")
      view.raw(html)
    end
  end
end
