module ActionMetaTags
  module Helpers
    extend ActiveSupport::Concern

    def meta_tags(object)
      class_name = ['Meta', params[:controller], params[:action]].join('/').classify
      class_name.constantize.new(object).render(self)
    end
  end
end
