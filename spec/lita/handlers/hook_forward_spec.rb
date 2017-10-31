require 'spec_helper'

describe Lita::Handlers::HookForward, lita_handler: true do

  it { routes_http(:get, '/lita/hook-forward').to(:receive) }

  describe '#receive' do

    let(:request) do
      request = double('Rack::Request')
      allow(request).to receive(:params).and_return(params)
      request
    end
    let(:params) { {'message' => 'hello'} }
    let(:response) { Rack::Response.new }

    before { Lita.config.handlers.hook_forward.default_room = '#baz' }

    it 'sends a notification message to the applicable rooms' do
      fake_room = Object.new
      allow(Lita::Room).to receive(:find_by_name).and_return(fake_room)
      allow(fake_room).to receive(:id).and_return('FAKE_ID')

      expect(robot).to receive(:send_message) do |target, message|
        expect(target.room).to eq('FAKE_ID')
        expect(message).to include('hello')
      end
      subject.receive(request, response)
    end
  end
end
