require 'yaml'
require 'uri'
require 'byebug'
class Scanner
  def self.begin
    cart_wrapper = CartWrapper.new(api_url)
    while scan
      barcode = $stdin.gets.chomp
      cart_wrapper.send_barcode(barcode)
    end
  end
  def self.scan
    true
  end

  def self.api_url
    env = ENV['RACK_ENV'] || 'development'
    config_file = File.expand_path('../../config/config.yml', __FILE__)
    config      = YAML.load(File.open(config_file))[env]
    URI(config['api_url'])
  end
  private_class_method :api_url
end
