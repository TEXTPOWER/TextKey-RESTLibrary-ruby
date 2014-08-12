# TestRemoveTempAPIKey.rb
# 
require 'json'
require 'textkey_rest'

# Setup
apiKey = "7ACD39DA-80C9-4952-B509-B5A21D4B0FB1";

# Create the textkey object
textkey = TextKeyRest.new(apiKey, false)

# Setup the API parameters
minutesDuration = 2

# Make the API Call to get an API Key
response = textkey.perform_GetTempAPI_Key(minutesDuration)

# If show flag is set show the return payload
if response
	# Pull out the data from the response
	response_obj = JSON.parse(response)
	tempAPI = response_obj['d']['apiKey']
	
	if response
		# Make the API Call to release the API Key
		response = textkey.perform_RemoveTempAPIKey(tempAPI, minutesDuration)
		
		# Pull out the data from the response
		response_obj = JSON.parse(response)
		response_data = response_obj['d']
	end
end

# Display the response 
puts "TextKey Results:"
puts JSON.pretty_generate response_data
