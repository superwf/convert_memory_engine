require 'rake'
require 'rails'
require 'active_record'
module SpeedupTest
  class Railtie < ::Rails::Railtie
    rake_tasks do
      import File.dirname(File.dirname(__FILE__)) + '/tasks/speedup_test.task'
    end
  end
end
