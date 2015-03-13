require 'spec_helper'

describe Routler::Consumer do

  before :each do
    @consumer = Routler::Consumer.new
  end

  describe 'load_file' do
    it 'load route content from a file' do
      output = @consumer.load_file 'spec/support/routes.txt'
      expect(output).to match (/conversations#destroy/)
    end
  end

end
