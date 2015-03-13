require 'spec_helper'

describe Routler::Formatters::Csv do

  before :each do
    controllers = []
    ['users', 'auth'].each do |controller|
      a = Routler::Controller.new controller
      a.add_action 'index'
      a.add_action 'update'
      a.add_action 'destroy'
      controllers << a
    end
    @formatter = Routler::Formatters::Csv.new(controllers)
  end

  describe '#format' do

    it 'should return the first line as headers' do
      csv = @formatter.format
      expect(csv.lines[0].chomp).to eq('Controller,Action')
    end

    it 'should return a row for each action' do
      csv = @formatter.format
      expect(csv.lines[6].chomp).to eq('auth,destroy')
    end

  end

end
