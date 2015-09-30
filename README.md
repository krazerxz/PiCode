# PiCode
Ruby backend for PiCart to run on a RaspberryPi

Application works by reading input from barcode scanner and posting to PiCart API.

Running the scan script starts a loop listening to standard in (Where the barcode scanner puts to).

Run/background the scan script and kill when finished.

# Running
* Create config file from example
* Plug in your barcode scanner
* ./scripts/scan.rb

