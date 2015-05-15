require 'spec_helper'

module Meta
  module Posts
    class Show < ActionMetaTags::Base
      title { title }
    end

    module Comments
      class Show < ActionMetaTags::Base
        title { title }
      end
    end
  end
end

RSpec.describe ActionMetaTags::Helpers do
  describe '#meta_tags' do
    let(:view) do
      ActionView::Base.new.tap do |view|
        view.controller = OpenStruct.new(params: params)
      end
    end

    let(:resource) { OpenStruct.new(title: 'Title') }
    subject { view.meta_tags(resource) }

    context 'controller is on root level' do
      let(:params) { { controller: 'posts', action: 'show' } }
      specify { is_expected.to eq('<title>Title</title>') }
    end

    context 'controller is nested' do
      let(:params) { { controller: 'posts/comments', action: 'show' } }
      specify { is_expected.to eq('<title>Title</title>') }
    end
  end
end
