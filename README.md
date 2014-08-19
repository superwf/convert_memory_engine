# ConvertMemoryEngine

When i use rspec to do a lot of test, each time database is inserted data and truncate table, when tables grows the speed grow down too much. At first i convert the db engine from innodb to memory in db/seed.rb file. After that i write this gem to do the job for more app.
Notice: Tables those contain text col can not convert to memory engine, so i convert those colums to string first. So if there are test case use too long string to insert, there would be trouble.

## Installation

Add this line to your application's Gemfile:

    gem 'convert_memory_engine'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install convert_memory_engine

## Usage

rake convert_memory_engine RAILS_ENV=test

## Contributing

1. Fork it ( https://github.com/superwf/convert_memory_engine/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
