require 'spec_helper'
describe 'porttest' do

  context 'with defaults for all parameters' do
    it { should contain_class('porttest') }
  end
end
