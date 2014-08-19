require "convert_memory_engine/version"

module ConvertMemoryEngine
  require File.dirname(__FILE__) + '/railtie' if defined?(::Rails)
end
