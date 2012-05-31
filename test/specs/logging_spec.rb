require 'rspec'

require_relative '../../lib/s_3'

describe Logging::Appenders::S3IO do
  
  it 'should create a double' do
    customer = double 'customer'
    customer.stub(:name).and_return 'foo'
    customer.name.should eq 'foo'
  end

end