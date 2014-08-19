require "speedup_test/version"

module SpeedupTest
  require File.dirname(__FILE__) + '/railtie' if defined?(::Rails)
end
