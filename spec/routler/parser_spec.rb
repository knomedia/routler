require 'spec_helper'

describe Routler::Parser do

  before :each do
    @p = Routler::Parser.new
  end

  it 'should have controllers, lines and error_lines attrs' do
    expect(@p.controllers).to eq({})
    expect(@p.lines).to eq(0)
    expect(@p.error_lines).to eq([])
  end

  describe '#parse_line' do
    it 'should parse a single line' do
      line = "registration_confirmation GET   /communications/:id/register(.:format)     communication_channels#confirm"
      output = @p.parse_line line
      expect(output[:name]).to eq('communication_channels')
      expect(output[:action]).to eq('confirm')
    end

    it 'should flag error when line parsing fails' do
      line = "registration_confirmation GET/communications/:id/register(.:format)communication_channels#confirm"
      output = @p.parse_line line
      expect(output[:error]).to eq(line)
    end
  end

  describe '#add_controller' do
    it 'should add invalid parsed objects to error_lines' do
      line = "registration_confirmation GET/communications/:id/register(.:format)communication_channels#confirm"
      output = @p.parse_line line
      @p.add_controller output
      expect(@p.error_lines.first).to eq(line)
    end

    it 'should add valid parsed objects to controllers' do
      line = "registration_confirmation GET   /communications/:id/register(.:format)     communication_channels#confirm"
      output = @p.parse_line line
      @p.add_controller(output)
      expect(@p.controllers['communication_channels'].actions).to eq(['confirm'])
    end

    it 'should add additional valid parsed objects to a single controllers' do
      line = "oauth_success GET  /oauth_success(.:format)  users#oauth_success"
      line2 = "oauth GET  /oauth(.:format)   users#oauth"
      @p.add_controller(@p.parse_line line)
      @p.add_controller(@p.parse_line line2)
      expect(@p.controllers['users'].actions).to eq(['oauth_success', 'oauth'])
    end
  end

  describe '#parse' do
    it 'should parse multiple lines' do
      content = "oauth_success GET  /oauth_success(.:format)  users#oauth_success"
      content = content + "\n"
      content = content + "oauth GET  /oauth(.:format)   users#oauth"
      @p.parse content
      expect(@p.controllers['users'].actions).to eq(['oauth_success', 'oauth'])
    end
  end

end
