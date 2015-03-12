require 'spec_helper'

describe Routler::Controller do

  before :each do
    @controller = Routler::Controller.new('testing')
  end

  it 'should hold a default name' do
    expect(@controller.name).to eq('testing')
  end
  it 'should start with an emptyp actions array' do
    expect(@controller.actions).to eq([])
  end


  describe 'add_action' do
    it 'should add actions' do
      @controller.add_action('index')
      expect(@controller.actions).to eq(['index'])
    end

    it 'should not add the same action more than once' do
      @controller.add_action('index')
      @controller.add_action('index')
      expect(@controller.actions).to eq(['index'])
    end
  end

end
