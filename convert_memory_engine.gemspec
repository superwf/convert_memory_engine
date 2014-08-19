# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'speedup_test/version'

Gem::Specification.new do |spec|
  spec.name          = "speedup_test"
  spec.version       = SpeedupTest::VERSION
  spec.authors       = ["wangfan"]
  spec.email         = ["wangfan@chgb.org.cn"]
  spec.summary       = %q{speed up rails test by mysql.}
  spec.description   = %q{
When i use rspec to do a lot of test, each time database is inserted data and truncate table, when tables grows the speed grow down too much. At first i convert the db engine from innodb to memory in db/seed.rb file. After that i write this gem to do the job for more app.
Notice: Tables those contain text col can not convert to memory engine, so i convert those colums to string first. So if there are test case use too long string to insert, there would be trouble.
}
  spec.homepage      = "http://wangfan.bj.cn"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
