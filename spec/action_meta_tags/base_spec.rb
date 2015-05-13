require 'spec_helper'

RSpec.describe ActionMetaTags::Base do
  class ResourceTags < ActionMetaTags::Base
    title { "#{title} | Site" }
    meta('http-equiv' => 'refresh') { "0;URL='http://example.com/'".html_safe }
  end

  let(:view)     { ActionView::Base.new }
  let(:resource) { OpenStruct.new(title: 'Title', description: 'description') }
  subject        { ResourceTags.new(resource).render(view) }

  specify '#title renders the title tag' do
    is_expected.to include('<title>Title | Site</title>')
  end

  specify '#meta renders a meta tag' do
    is_expected.to include(%q(<meta http-equiv="refresh" content="0;URL='http://example.com/'" />))
  end
end
