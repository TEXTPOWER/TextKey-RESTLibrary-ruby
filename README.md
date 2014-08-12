TextKey REST Library
====================

This Ruby library allows you to use TextKey's REST API calls server-side from a Ruby backend.

Common use-Case
---------------

To ensure a secure environment, you don't want to use APIs directly from the front-end, but rather through web-services inside your Ruby backend.

More Information
----------------

To get more detailed information on the TextKey API Services or to investigate the API in more detail, you can refer to the following:

* [TextKey Developer Site](http://developer.textkey.com)
* [TextKey API Call Documentation](http://developer.textkey.com/apidocumentation.php)
* [Test All TextKey API Calls](http://developer.textkey.com/apitestapicalls.php)
* [TextKey Sample Site](http://developer.textkey.com/apitextkeyexample.php)

Installing the Library
----------------------

Add this line to your application's Gemfile:

```ruby
gem 'textkey_rest', '~> 1.0.0'
```

Or install it from the command line:

    $ gem install textkey_rest
    
For more information go to [http://rubygems.org/](https://rubygems.org/gems/textkey_rest)

Building the textkey_rest GEM
-----------------------------

From the root directory, run the following:

    $ gem build textkey_rest.gemspec

Then you can install it yourself locally:

    $ gem install ./textkey_rest-X.X.X.gem

How to use it?
--------------

The simple use case is to create a textkey object, call the appropriate API method and handle the returned JSON payload. The class will handle the details between the request and response and will return an object to work with.

For example, here is a use case to check if a user has already been registered using the `doesRegistrationUserIDExist` API Call.

```ruby
# TestDoesRegistrationUserIdExist.rb
# 
require 'json'
require 'textkey_rest'

# Setup
apiKey = "PUT API KEY HERE"

# Create the textkey object
textkey = TextKeyRest.new(apiKey, false)

# Setup the API parameters
userID = "BobSmithUID"
isHashed = "TRUE"

# Make the API Call
response = textkey.perform_DoesRegistrationUserIDExist(userID, isHashed)

# Pull out the data from the response
response_obj = JSON.parse(response)
response_data = response_obj['d']

# Display the response 
puts "TextKey Results:"
puts JSON.pretty_generate response_data
```

Initialization
---------------

The basic initialize step consists of including the REST Library and then creating a textkey object.

```ruby
require 'json'
require 'textkey_rest'

# Setup
apiKey = "PUT API KEY HERE"

# Create the textkey object
textkey = TextKeyRest.new(apiKey, false)
```

Making the API Call
-------------------

Once initialized, you can now make a call out to the specific TextKey API using the textkey object you just created.

```ruby
# Setup the API parameters
userID = "BobSmithUID"
isHashed = "TRUE"

# Make the API Call
response = textkey.perform_DoesRegistrationUserIDExist(userID, isHashed)
```

Handling the resulting payload
------------------------------

The API call will return back a JSON string with all of the API fields included. It is wrapped in the `d` parent element so that wrapper should be removed.

```ruby
# Pull out the data from the response
response_obj = JSON.parse(response)
response_data = response_obj['d']

# Display the response 
puts "TextKey Results:"
puts JSON.pretty_generate response_data
```

NOTE: If there is an error, the `errorDescr` field of the returned JSON payload will contain a value.

Sample/Test Code
----------------

There is sample/test code in the [test Folder](https://github.com/TEXTPOWER/RESTLibrary-ruby/tree/master/test) for each TextKey API call using the shared library. 

To try out the test code, just set your API Key in the [configuration.rb](https://github.com/TEXTPOWER/RESTLibrary-ruby/blob/master/test/configuration.rb) file in the test folder and then you should be able to either run each test individually. For example:

    $ ruby test_GetTempAPIKey.rb

Or if you want to run all of the tests at once:

    $ ruby TestAll.rb

Contributing to this SDK
------------------------

**Issues**

Please discuss issues and features on Github Issues. We'll be happy to answer to your questions and improve the SDK based on your feedback.

**Pull requests**

You are welcome to fork this SDK and to make pull requests on Github. We'll review each of them, and integrate in a future release if they are relevant.
