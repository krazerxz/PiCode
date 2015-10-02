require 'json'

class CartWrapper
  def initialize(uri)
    @uri = uri
    @http = Net::HTTP.new(uri.host, uri.port)
  end

  def send_barcode(barcode)
    request = Net::HTTP::Post.new(@uri, 'Content-Type' => 'application/json')
    request.body = JSON.generate('product' => { 'barcode' => barcode })
    @http.request(request)
  end
end
