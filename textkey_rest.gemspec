# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'textkey_rest/version'

Gem::Specification.new do |spec|
  spec.name          = "textkey_rest"
  spec.version       = TextkeyRest::VERSION
  spec.authors       = ["Stan Shaul"]
  spec.email         = ["textkey@textpower.com"]
  spec.summary       = %q{Allows use of all of TextKey's REST API calls.}
  spec.description   = %q{TextKey is an award winning, patent-pending next-generation omni-factor authenticationTM (seven-factors of authentication) system that is highly secure, simple to install and easy to use. It can be used to protect web sites, mobile devices, virtual private networks (VPNs) or any other data that requires privacy, confidentiality or restricted access. It works by having users send a simple text message (SMS) FROM their cell phones INTO the TextKeyTM system to authenticate their identity.}
  spec.homepage      = "http://developer.textkey.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "json", "~> 0"
  spec.add_development_dependency "rest-client", "~> 0"
end
