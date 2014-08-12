# TestRegisterTextKeyUser.rb
# 
require 'json'
require 'textkey_rest'
require './configuration'

# Setup
apiKey = TextkeyRestTest::Config::API_KEY

# Create the textkey object
textkey = TextKeyRest.new(apiKey, false)

# Setup the API parameters
command = 0
cellNumber = "8054100577"
ownerFName = ""
ownerLName = ""
suppl1 = ""
suppl2 = ""
userID = ""
isHashed = "TRUE"
pinCode = "" 
distressPinCode = ""
textKeyMode = 0
receiveMode = 0

# Make the API Call
response = textkey.perform_registerTextKeyUser(command,
											   cellNumber, 
											   ownerFName, 
											   ownerLName, 
											   suppl1, 
											   suppl2, 
											   userID, 
											   isHashed, 
											   pinCode, 
											   distressPinCode, 
											   textKeyMode, 
											   receiveMode)

# Pull out the data from the response
response_obj = JSON.parse(response)
response_data = response_obj['d']

# Display the response 
puts "TextKey Results:"
puts JSON.pretty_generate response_data
