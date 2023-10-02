# frozen_string_literal: true

require 'spec_helper'
require 'puppet/type/openxpki'

RSpec.describe 'the openxpki type' do
  it 'loads' do
    expect(Puppet::Type.type(:openxpki)).not_to be_nil
  end
end
