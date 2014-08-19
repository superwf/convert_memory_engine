require 'rake'
require 'rails'
require 'active_record'
module ConvertMemoryEngine
  class Railtie < ::Rails::Railtie
    rake_tasks do
      import File.dirname(File.dirname(__FILE__)) + '/lib/tasks/convert_memory_engine.rake'
    end
  end
end
