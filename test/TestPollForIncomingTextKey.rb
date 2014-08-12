# TestPollForIncomingTextKey.rb
# 
require 'json'
require 'textkey_rest'

# Setup
apiKey = "7ACD39DA-80C9-4952-B509-B5A21D4B0FB1";

# Create the textkey object
textkey = TextKeyRest.new(apiKey, false)

# Setup the API parameters
textKey = "5347788"

# Make the API Call
response = textkey.perform_PollForIncomingTextKey(textKey)

# Pull out the data from the response
response_obj = JSON.parse(response)
response_data = response_obj['d']

# Display the response 
puts "TextKey Results:"
puts JSON.pretty_generate response_data
