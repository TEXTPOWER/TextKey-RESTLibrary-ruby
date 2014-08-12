# TestRegisterTextKeyUserCSA.rb
# 
require 'json'
require 'textkey_rest'
require './configuration'

# Setup
apiKey = TextkeyRestTest::Config::API_KEY

# Create the textkey object
textkey = TextKeyRest.new(apiKey, false)

# Setup the API parameters
command = 1
cellNumber = "8054100577"
ownerFName = "Stan"
ownerLName = ""
suppl1 = "Suppl1"
suppl2 = "Suppl2"
ownerBirthDate = "01/01/1970"
ownerGender = "M"
userID = "Stan"
isHashed = "TRUE"
pinCode = "1234" 
distressPinCode = "4321"
q1 = "Question 1"
a1 = "Answer 1"
q2 = "Question 2"
a2 = "Answer 2"
q3 = "Question 3"
a3 = "Answer 3"
textKeyMode = 0
receiveMode = 0

# Make the API Call
response = textkey.perform_registerTextKeyUserCSA(command,
												  cellNumber, 
												  ownerFName, 
												  ownerLName, 
												  suppl1, 
												  suppl2,
												  ownerBirthDate,
												  ownerGender,
												  userID, 
												  isHashed, 
												  pinCode, 
												  distressPinCode, 
												  q1,
												  a1,
												  q2,
												  a2,
												  q3,
												  a3,
												  textKeyMode, 
												  receiveMode)

# Pull out the data from the response
response_obj = JSON.parse(response)
response_data = response_obj['d']

# Display the response 
puts "TextKey Results:"
puts JSON.pretty_generate response_data
