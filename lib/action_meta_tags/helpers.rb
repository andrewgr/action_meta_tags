module ActionMetaTags
  module Helpers
    extend ActiveSupport::Concern

    def meta_tags(object)
      class_name = [
        'Meta',
        params[:controller].capitalize,
        params[:action].capitalize
      ].join('::')
      class_name.constantize.new(object).render(self)
    end

    private

    def find_domain(host)
      host
    end
  end
end
