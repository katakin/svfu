# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Server::Application.initialize!

Encoding.default_internal = 'utf-8'
Encoding.default_external = 'utf-8'