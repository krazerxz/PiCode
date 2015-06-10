require 'spec_helper'

describe CartWrapper do
  describe '#initialize' do
    let(:parsed_uri) { double(:parsed_uri, host: 'http://example.com', port: 1) }

    before do
      allow(URI).to receive(:parse).and_return(parsed_uri)
    end

    it 'it creates an instance of net/http' do
      expect(Net::HTTP).to receive(:new).with('http://example.com', 1)
      CartWrapper.new('http://example.com')
    end
  end

  describe '#send_barcode' do
    let(:net_http)         { double(:net_http) }
    let(:net_http_request) { double(:net_http_request).as_null_object }
    let(:cart_wrapper)     { CartWrapper.new('http://example.com') }

    before do
      allow(Net::HTTP::Post).to receive(:new).and_return(net_http_request)
      allow(Net::HTTP).to receive(:new).and_return(net_http)
      allow(net_http).to receive(:request)
    end

    it 'it creates a new http post' do
      expect(Net::HTTP::Post).to receive(:new).with('api/barcodes/')
      cart_wrapper.send_barcode(1234)
    end

    xit 'sets the type and body of request' do
      expect(net_http_request).to receive(:add_field).with('Content-Type', 'application/json')
      expect(net_http_request).to receive(:body).with('barcode' => 1234)
      cart_wrapper.send_barcode(1234)
    end

    it 'posts the barcode' do
      expect(net_http).to receive(:request).with(net_http_request)
      cart_wrapper.send_barcode(1234)
    end
  end
end
