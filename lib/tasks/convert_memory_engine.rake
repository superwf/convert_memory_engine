require 'rails'
env_file = File.join(Rails.root, 'config/environment')
require env_file if File.exists?("#{env_file}.rb")
desc 'convert mysql tables engine to memory in test database'
task :convert_memory_engine do
  db = ::ActiveRecord::Base.connection
  if ::Rails.env.test?
    tables = db.tables
    tables.delete 'schema_migrations'
    tables.each do |t|
      begin
        model_class = eval(t.classify)
        model_class.columns.each do |c|
          db.execute "ALTER TABLE #{t} CHANGE #{c.name} #{c.name} VARCHAR(255)" if c.type == :text
        end
      rescue
        puts "table #{t} not converted, because no model for table #{t}"
      end
      db.execute "ALTER TABLE #{t} ENGINE = MEMORY"
      puts "table #{t} converts success"
    end
  else
    raise "only in test mode"
  end
end
