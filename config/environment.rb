Encoding.default_external = Encoding.default_internal = Encoding::UTF_8
# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Server::Application.initialize!
