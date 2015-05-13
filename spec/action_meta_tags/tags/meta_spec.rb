require 'spec_helper'

RSpec.describe ActionMetaTags::Tags::Meta do
  let(:view)     { ActionView::Base.new }
  let(:resource) { OpenStruct.new(description: 'Lorem ipsum.') }
  subject(:tag)  { described_class.new(name: :description) { description } }

  specify do
    expected_html = %q{<meta name="description" content="Lorem ipsum." />}
    expect(tag.render(view, resource)).to eq(expected_html)
  end
end
