require 'rspec'
require 'rails'
require 'active_record'
require 'rake'
require 'yaml'

class Testmodel < ActiveRecord::Base
end

describe 'test convert task' do
  before :all do
    config = YAML.load_file(File.join(Dir.pwd, 'spec/config/database.yml'))
    ActiveRecord::Base.establish_connection config['test']
    @db = ActiveRecord::Base.connection
    @table_name = Testmodel.table_name
    @db.execute %Q{
      CREATE TABLE `test`.`#{@table_name}` (
      `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
      `name` VARCHAR( 255 ) NOT NULL,
      `profile` text NULL
      ) ENGINE = InnoDB;
    }
  end

  after :all do
    @db.execute %Q{DROP TABLE `test`.`#{@table_name}`}
  end

  it 'test the engine' do
    table_info = @db.exec_query "SHOW TABLE STATUS WHERE name = '#{@table_name}'"
    expect(table_info.rows[0][1]).to eq('InnoDB')
    app = Rake.application
    allow(Rails).to receive(:root).and_return('spec')
    env = double('env')
    allow(env).to receive(:test?).and_return(true)
    allow(Rails).to receive(:env).and_return(env)
    load File.join(Dir.pwd, 'lib/tasks/convert_memory_engine.rake')
    app['convert_memory_engine'].invoke
    table_info = @db.exec_query "SHOW TABLE STATUS WHERE name = '#{@table_name}'"
    puts table_info.rows[0][1]
    expect(table_info.rows[0][1]).to eq('MEMORY')
  end
end
