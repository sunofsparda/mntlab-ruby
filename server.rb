#!/usr/bin/env ruby

require 'yaml'

config = YAML.load_file('config.yaml')
p config
p config['user']
p config['email_list']

hash = { mtn: :cool, lab: %w(1 2 3 4) }
File.open('config2.yaml', "w") { |f| f.write(hash.to_yaml) }

puts `ls -la` # кавычки - тильда !!