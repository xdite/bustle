require_relative '../../spec_helper'

module Bustle
  describe 'Subscriber' do
    let(:described_class) { Subscriber }

    it_behaves_like 'model'
  end
end
