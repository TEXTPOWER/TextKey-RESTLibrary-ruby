#
# textkey.rb
# 
# This library allows for making RESTful API requests
# to the TextKey REST API Service
#
# Author::  Stan Shaul
# Copyright:: Copyright (c) 2014 TextPower, Inc.
# License::   Distributes under the same terms as Ruby

require 'rest_client'
require 'json'
require 'textkey_rest/configuration'

class TextKeyRest
  @authKey
  @displayInfo

  # constructor
  def initialize(authKey, displayInfo=false)
	# Set the API Key
    @authKey = authKey
	
	# Set the display options
    @displayInfo = displayInfo
  end

  # 
  # performs the POST request
  # 
  # * *Args* :
  #   - +url+ -> The TextKey REST URL
  #   - +postdata+ -> The post data for the request
  # 
  # * *Returns* :
  #   - +The returned JSON payload as a string
  # 
  # * *Raises* :
  # 
  def sendAPIRequest(url, postdata)
    # If show flag is set show the parameters
    if @displayInfo
      puts 'url: ' + url
      puts 'Payload:'
      puts JSON.pretty_generate postdata
    end
	
    # Send the API request
    response = RestClient.post(url, 
                               postdata.to_json, 
                               :content_type => 'application/json')

    # If show flag is set show the return payload
    if @displayInfo
      puts 'Results:'
      puts JSON.pretty_generate JSON.parse(response)
    end
	
    return response.body
  end

  # 
  # perform_GetTempAPI_Key - Sends the gettempAPIKey API Request and return the results
  # 
  # * *Args* :
  #   - +minutesDuration+ -> The number of minutes that this API key will be valid
  # 
  # * *Returns* :
  #   - +The returned JSON payload as a string
  # 
  # * *Raises* :
  # 
  def perform_GetTempAPI_Key(minutesDuration)
    # Build the URL
    resturl = TextkeyRest::Config::TK_BASE[:rest_url] + "gettempAPIKey";
	
    # Setup the payload
    restpayload = { :DataIn  => { :apiKey => @authKey, :minutesDuration => minutesDuration } }
	
    # Make the API request
    return sendAPIRequest(resturl, restpayload)
  end

  #
  # perform_registerTextKeyUser - Send the perform_registerTextKeyUser API Request 
  # and return the results
  # 
  # * *Args* :
  #   - +command+ -> The register command	
  #   - +cellNumber+ -> The Cell Number that you are registering	
  #   - +ownerFName+ -> User's First Name
  #   - +ownerLName+ -> User's Last Name
  #   - +suppl1+ -> An additional identifier chosen by the customer
  #   - +suppl2+ -> Another additional identifier chosen by the customer
  #   - +userID+ -> The user id that the end user has entered on the web site login page
  #   - +isHashed+ -> Is the user id hashed
  #   - +pinCode+ -> The numeric Pin Code
  #   - +distressPinCode+ -> The numeric Distress Pin Code 
  #   - +textKeyMode+ -> The TextKey validation mode
  #   - +receiveMode+ -> The TextKey receive mode
  # 
  # * *Returns* :
  #   - +The returned JSON payload as a string
  # 
  def perform_registerTextKeyUser(command, cellNumber, ownerFName, ownerLName, suppl1, suppl2, userID, isHashed, pinCode, distressPinCode, textKeyMode, receiveMode)		
    # Build the URL
    resturl = TextkeyRest::Config::TK_BASE[:rest_url] + "registerTextKeyUser";
		
    # Setup the payload
    restpayload = { :DataIn  => { :apiKey => @authKey, :command => command, :cellNumber => cellNumber, :ownerFName => ownerFName, :ownerLName => ownerLName, :suppl1 => suppl1, :suppl2 => suppl2, :userID => userID, :isHashed => isHashed, :pinCode => pinCode, :distresspinCode => distressPinCode, :textKeyMode => textKeyMode, :receiveMode => receiveMode } }
		
    # Make the API request
    return sendAPIRequest(resturl, restpayload)
  end

  #
  # perform_registerTextKeyUserCSA - Send the perform_registerTextKeyUserCSA API Request 
  # and return the results
  # 
  # * *Args* :
  #   - +command+ -> The register command	
  #   - +cellNumber+ -> The Cell Number that you are registering	
  #   - +ownerFName+ -> User's First Name
  #   - +ownerLName+ -> User's Last Name
  #   - +suppl1+ -> An additional identifier chosen by the customer
  #   - +suppl2+ -> Another additional identifier chosen by the customer
  #   - +ownerBirthDate+ -> Users birth date. The format should be MM/DD/YYYY (i.e. 12/25/1984)
  #   - +gender+ -> The users gender. The values should be either M or F.
  #   - +userID+ -> The user id that the end user has entered on the web site login page
  #   - +isHashed+ -> Is the user id hashed
  #   - +pinCode+ -> The numeric Pin Code
  #   - +q1+ -> The first user profile question. 
  #   - +a1+ -> The answer to the first user question.
  #   - +q2+ -> The second user profile question. 
  #   - +a2+ -> The answer to the second user question.
  #   - +q3+ -> The third user profile question. 
  #   - +a3+ -> The answer to the third user question.
  #   - +textKeyMode+ -> The TextKey validation mode
  #   - +receiveMode+ -> The TextKey receive mode.
  #  
  # * *Returns* :
  #   - +The returned JSON payload as a string
  # 
  def perform_registerTextKeyUserCSA(command,
                                     cellNumber, 
                                     ownerFName, 
                                     ownerLName, 
                                     suppl1, 
                                     suppl2, 
                                     ownerBirthDate, 
                                     gender, 											     
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

    # Build the URL
    resturl = TextkeyRest::Config::TK_BASE[:rest_url] + "registerTextKeyUser";
		
    # Setup the payload
    restpayload = { :DataIn  => { :apiKey => @authKey, :command => command, :cellNumber => cellNumber, :ownerFName => ownerFName, :ownerLName => ownerLName, :suppl1 => suppl1, :suppl2 => suppl2, :ownerBirthDate => ownerBirthDate, :ownergender => gender, :userID => userID, :isHashed => isHashed, :pinCode => pinCode, :distresspinCode => distressPinCode, :q1 => q1, :a1 => a1, :q2 => q2, :a2 => a2, :q3 => q3, :a3 => a3, :textKeyMode => textKeyMode, :receiveMode => receiveMode } }
		
    # Make the API request
    return sendAPIRequest(resturl, restpayload)
  end

  #
  # perform_IssueTextKeyFromUserId - Send the perform_IssueTextKeyFromUserId API Request 
  # and return the results
  # 
  # * *Args* :
  #   - +userID+ -> The unique identifier that was used when the user was registered with
  #   - +isHashed+ -> Indicates if the userID was hashed before the user was registered.
  #  
  # * *Returns* :
  #   - +The returned JSON payload as a string
  # 
  def perform_IssueTextKeyFromUserId(userID, 
                                     isHashed)		

    # Build the URL
    resturl = TextkeyRest::Config::TK_BASE[:rest_url] + "issueTextKeyFromUserId";
		
    # Setup the payload
    restpayload = { :DataIn  => { :apiKey => @authKey, :userID => userID, :isHashed => isHashed } }
		
    # Make the API request
    return sendAPIRequest(resturl, restpayload)
  end

  #
  # perform_IssueTextKeyFromUserId - Send the perform_IssueTextKeyFromUserId API Request 
  # and return the results
  # 
  # * *Args* :
  #   - +retrieveBy+ -> Defines the type of retrieve option to use
  #   - +cellNumber+ -> The Cell Number that you are registering	
  #   - +suppl1+ -> The suppl1 field value that you are searching for
  #   - +suppl2+ -> The suppl2 field value that you are searching fo
  #  
  # * *Returns* :
  #   - +The returned JSON payload as a string
  # 
  def perform_getTextKeyRegistration(retrieveBy,
                                     cellNumber, 
                                     suppl1, 
                                     suppl2)		

    # Build the URL
    resturl = TextkeyRest::Config::TK_BASE[:rest_url] + "getTextKeyRegistration";
		
    # Setup the payload
    restpayload = { :DataIn  => { :apiKey => @authKey, :retrieveBy => retrieveBy, :cellNumber => cellNumber, :suppl1 => suppl1, :suppl2 => suppl2 } }
		
    # Make the API request
    return sendAPIRequest(resturl, restpayload)
  end

  #
  # perform_DoesRegistrationUserIDExist - Send the perform_DoesRegistrationUserIDExist API Request 
  # and return the results
  # 
  # * *Args* :
  #   - +userID+ -> The unique identifier that was used when the user was registered with
  #   - +isHashed+ -> Indicates if the userID was hashed before the user was registered.
  #  
  # * *Returns* :
  #   - +The returned JSON payload as a string
  # 
  def perform_DoesRegistrationUserIDExist(userID, 
                                          isHashed)		

    # Build the URL
    resturl = TextkeyRest::Config::TK_BASE[:rest_url] + "doesRegistrationUserIdExist";
		
    # Setup the payload
    restpayload = { :DataIn  => { :apiKey => @authKey, :userID => userID, :isHashed => isHashed } }
		
    # Make the API request
    return sendAPIRequest(resturl, restpayload)
  end

  #
  # perform_DoesRegistrationCellNumberExist - Send the doesRegistrationcellNumberExist API Request 
  # and return the results
  # 
  # * *Args* :
  #   - +cellNumber+ -> The Cell Number that was used when the user was registered with
  #  
  # * *Returns* :
  #   - +The returned JSON payload as a string
  # 
  def perform_DoesRegistrationCellNumberExist(cellNumber)		

    # Build the URL
    resturl = TextkeyRest::Config::TK_BASE[:rest_url] + "doesRegistrationcellNumberExist";
		
    # Setup the payload
    restpayload = { :DataIn  => { :apiKey => @authKey, :cellNumber => cellNumber } }
		
    # Make the API request
    return sendAPIRequest(resturl, restpayload)
  end
	
  #
  # perform_CreateNewCellNumberProxy - Send the createNewcellNumberProxy API Request 
  # and return the results
  # 
  # * *Args* :
  #   - +cellNumber+ -> The Cell Number that was used when the user was registered with
  #  
  # * *Returns* :
  #   - +The returned JSON payload as a string
  # 
  def perform_CreateNewCellNumberProxy(cellNumber)		

    # Build the URL
    resturl = TextkeyRest::Config::TK_BASE[:rest_url] + "createNewcellNumberProxy";
		
    # Setup the payload
    restpayload = { :DataIn  => { :apiKey => @authKey, :truecellNumber => cellNumber } }
		
    # Make the API request
    return sendAPIRequest(resturl, restpayload)
  end

  #
  # perform_RemoveTempAPIKey - Send the removetempAPIKey API Request 
  # and return the results
  # 
  # * *Args* :
  #   - +tempAPIKey+ -> The temporary API Key to remove
  #   - +minutesDuration+ -> This parameter is ignored but still must still be passed in with an integer value
  #  
  # * *Returns* :
  #   - +The returned JSON payload as a string
  # 
  def perform_RemoveTempAPIKey(tempAPIKey,
                               minutesDuration)		

    # Build the URL
    resturl = TextkeyRest::Config::TK_BASE[:rest_url] + "removetempAPIKey";
		
    # Setup the payload
    restpayload = { :DataIn  => { :apiKey => @authKey, :apiKey => tempAPIKey, :minutesDuration => minutesDuration } }
		
    # Make the API request
    return sendAPIRequest(resturl, restpayload)
  end
	
  #
  # perform_IssueTextKeyFromCellNumber - Send the issueTextKeyFromcellNumber API Request 
  # and return the results
  # 
  # * *Args* :
  #   - +cellNumber+ -> The Cell Number that was used when the user was registered with
  #  
  # * *Returns* :
  #   - +The returned JSON payload as a string
  # 
  def perform_IssueTextKeyFromCellNumber(cellNumber)		

    # Build the URL
    resturl = TextkeyRest::Config::TK_BASE[:rest_url] + "issueTextKeyFromcellNumber";
		
    # Setup the payload
    restpayload = { :DataIn  => { :apiKey => @authKey, :cellNumber => cellNumber } }
		
    # Make the API request
    return sendAPIRequest(resturl, restpayload)
  end

  #
  # perform_PollForIncomingTextKey - Send the pollForIncomingTextKey API Request 
  # and return the results
  # 
  # * *Args* :
  #   - +TextKey+ -> The TextKey to check for
  #  
  # * *Returns* :
  #   - +The returned JSON payload as a string
  # 
  def perform_PollForIncomingTextKey(textKey)		

    # Build the URL
    resturl = TextkeyRest::Config::TK_BASE[:rest_url] + "pollForIncomingTextKey";
		
    # Setup the payload
    restpayload = { :DataIn  => { :apiKey => @authKey, :textKey => textKey } }
		
    # Make the API request
    return sendAPIRequest(resturl, restpayload)
  end

  #
  # perform_ValidateTextKeyFromUserId - Send the validateTextKeyFromUserId API Request 
  # and return the results
  # 
  # * *Args* :
  #   - +userID+ -> The unique identifier that was used when the user was registered with
  #   - +TextKey+ -> The TextKey to check for
  #   - +TextKeyVC+ -> The TextKey Validation Code to check for
  #   - +isHashed+ -> Indicates if the userID was hashed before the user was registered.
  #  
  # * *Returns* :
  #   - +The returned JSON payload as a string
  # 
  def perform_ValidateTextKeyFromUserId(userID,
                                        textKey,
                                        textKeyVC,
                                        isHashed)		

    # Build the URL
    resturl = TextkeyRest::Config::TK_BASE[:rest_url] + "validateTextKeyFromUserId";
		
    # Setup the payload
    restpayload = { :DataIn  => { :apiKey => @authKey, :userID => userID, :textKey => textKey, :validationCode => textKeyVC, :isHashed => isHashed } }
		
    # Make the API request
    return sendAPIRequest(resturl, restpayload)
  end

  #
  # perform_ValidateTextKeyFromCellNumber - Send the validateTextKeyFromcellNumber API Request 
  # and return the results
  # 
  # * *Args* :
  #   - +cellNumber+ -> The Cell Number that was used when the user was registered with
  #   - +TextKey+ -> The TextKey to check for
  #   - +TextKeyVC+ -> The TextKey Validation Code to check for
  #  
  # * *Returns* :
  #   - +The returned JSON payload as a string
  # 
  def perform_ValidateTextKeyFromCellNumber(cellNumber,
                                            textKey,
                                            textKeyVC)		

    # Build the URL
    resturl = TextkeyRest::Config::TK_BASE[:rest_url] + "validateTextKeyFromcellNumber";
		
    # Setup the payload
    restpayload = { :DataIn  => { :apiKey => @authKey, :cellNumber => cellNumber, :textKey => textKey, :validationCode => textKeyVC } }
		
    # Make the API request
    return sendAPIRequest(resturl, restpayload)
  end

end
