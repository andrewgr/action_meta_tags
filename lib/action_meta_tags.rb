require 'active_support'
require 'action_meta_tags/version'
require 'action_meta_tags/helpers'

ActiveSupport.on_load(:action_view) do
  include ActionMetaTags::Helpers
end
