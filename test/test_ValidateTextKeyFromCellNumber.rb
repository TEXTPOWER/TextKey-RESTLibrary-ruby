# TestValidateTextKeyFromCellNumber.rb
# 
require 'json'
require 'textkey_rest'
require './configuration'

# Setup
apiKey = TextkeyRestTest::Config::API_KEY

# Create the textkey object
textkey = TextKeyRest.new(apiKey, false)

# Setup the API parameters
cellNumber = "8054100577"
textKey = "4819399"
textKeyVC = "57G14"

# Make the API Call
response = textkey.perform_ValidateTextKeyFromCellNumber(cellNumber, 
														 textKey,
														 textKeyVC)

# Pull out the data from the response
response_obj = JSON.parse(response)
response_data = response_obj['d']

# Display the response 
puts "TextKey Results:"
puts JSON.pretty_generate response_data
