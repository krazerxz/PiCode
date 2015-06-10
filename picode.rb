require 'bundler'
Bundler.require

class PiCode
  Dir[File.join(File.dirname(__FILE__), 'services', '*.rb')].each    { |f| require f }
end
