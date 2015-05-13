require 'spec_helper'

RSpec.describe ActionMetaTags::Tags::Link do
  let(:view)     { ActionView::Base.new }
  let(:resource) { OpenStruct.new(url: 'http://example.org/') }
  subject(:tag)  { described_class.new(rel: :canonical) { url } }

  specify do
    expected_html = %q{<link rel="canonical" href="http://example.org/" />}
    expect(tag.render(view, resource)).to eq(expected_html)
  end
end
