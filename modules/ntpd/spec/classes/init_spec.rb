require 'spec_helper'
describe 'ntpd' do

  context 'with defaults for all parameters' do
    it { should contain_class('ntpd') }
  end
end
