require 'rspec'

require 'watir_amazon'

RSpec.configure do|config|
	config.color = true
	config.tty = true
	config.formatter = :documentation
end