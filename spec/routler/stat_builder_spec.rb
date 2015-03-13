require 'spec_helper'

describe Routler::StatBuilder do

  def controller_double name
    actions = double()
    allow(actions).to receive(:length).and_return(2)
    ct = double()
    allow(ct).to receive(:name).and_return(name)
    allow(ct).to receive(:actions).and_return(actions)
    ct
  end

  before :each do
    controllers = []
    ['users', 'auth'].each {|c| controllers << controller_double(c)}
    parser = double()
    allow(parser).to receive(:lines).and_return(50)
    allow(parser).to receive(:error_lines).and_return(['errorline', 'another errorline'])
    allow(parser).to receive(:all_controllers).and_return(controllers)
    @sb = Routler::StatBuilder.new parser
  end

  it 'should have a parser' do
    expect(@sb.parser).to_not eq(nil)
  end

  describe '#display' do

    it 'should display the number of error lines' do
      expect(@sb.display).to match(/Parsing errors: 2/)
    end

    it 'should display the number of lines parsed' do
      expect(@sb.display).to match(/Lines parsed: 50/)
    end

    it 'should display the number of controllers found' do
      expect(@sb.display).to match(/Controllers found: 2/)
    end

    it 'should display the number of actions found' do
      expect(@sb.display).to match(/Actions found: 4/)
    end
  end

end

