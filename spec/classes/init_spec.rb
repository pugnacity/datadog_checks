require 'spec_helper'
describe 'datadog_checks' do

  context 'with defaults for all parameters' do
    it { should contain_class('datadog_checks') }
  end
end
