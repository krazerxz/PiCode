require 'spec_helper'

describe Scanner do
  describe 'begin' do
    let(:cart_wrapper) { double(:cart_wrapper) }
    before do
      allow(CartWrapper).to receive(:new).and_return(cart_wrapper)
      allow($stdin).to receive(:gets).and_return("1234\n")
      allow(cart_wrapper).to receive(:send_barcode)
      allow(Scanner).to receive(:scan).and_return(true, false)
    end

    it 'creates a cartwrapper' do
      expect(CartWrapper).to receive(:new)
      Scanner.begin
    end
    it 'sends barcode to cart wrapper' do
      expect(cart_wrapper).to receive(:send_barcode).with('1234')
      Scanner.begin
    end
  end
  describe 'scan' do
    it 'returns true' do
      expect(Scanner.scan).to be(true)
    end
  end
end
