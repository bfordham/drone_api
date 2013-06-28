require 'spec_helper'

describe 'Dronestream' do
  it 'should return correct version string' do
    Dronestream.version.should == "Dronestream version #{Dronestream::VERSION}"
  end
end

describe 'Dronestream::Strike' do
	before do
		@strike = Dronestream::Strike.new
	end

	subject { @strike }

	it { should_not respond_to(:some_random_thing) }

	it { should respond_to(:id) }
	it { should respond_to(:number) }
	it { should respond_to(:country) }
	it { should respond_to(:date) }
	it { should respond_to(:town) }
	it { should respond_to(:location) }
	it { should respond_to(:deaths) }
	it { should respond_to(:deaths_min) }
	it { should respond_to(:deaths_max) }
	it { should respond_to(:civilians) }
	it { should respond_to(:injuries) }
	it { should respond_to(:children) }
	it { should respond_to(:tweet_id) }
	it { should respond_to(:bureau_id) }
	it { should respond_to(:bij_summary_short) }
	it { should respond_to(:bij_link) }
	it { should respond_to(:target) }
	it { should respond_to(:lat) }
	it { should respond_to(:lon) }
	it { should respond_to(:articles) }
	it { should respond_to(:names) }
end