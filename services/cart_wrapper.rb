class CartWrapper
  def initialize(uri)
    @http = Net::HTTP.new(uri.host, uri.port)
  end

  def send_barcode(barcode)
    request = Net::HTTP::Post.new('api/barcodes/')

    request.add_field('Content-Type', 'application/json')
    request.body = { 'barcode' => barcode }
    @http.request(request)
  end
end
