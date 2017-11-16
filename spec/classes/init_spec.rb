require 'spec_helper'
describe 'windhcp' do
  context 'with default values for all parameters' do
    it { should contain_class('windhcp') }
  end
end
