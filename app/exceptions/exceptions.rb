##
# Define the application-specific error hierarchy here.
#
# All application errors must descend from ApplicationError.
# Further descendents of these errors may be defined locally within other files.

module Exceptions
  class ApplicationError < StandardError; end
end