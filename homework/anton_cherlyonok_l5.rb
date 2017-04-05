#!/usr/bin/env ruby

class Cli
  Commands = []

  def self.command_by_name(name)
    command = name.split(' ')
    command_class = Commands.find { |e| e.name == command[0] }
    begin
      command_class.new.run(command[1]) unless command_class.nil?
    rescue NoMethodError => exc
      p '-' * 50
      p exc.backtrace
      p exc.message
    end
  end

  protected

  def say(*args)
    puts "current time: #{Time.now.strftime('%H:%M:%S')}"
    puts "script name: #{$PROGRAM_NAME}"
    puts (args[0]).to_s
  end
end

class Help < Cli
  def self.name
    'help'
  end

  def self.description
    'get help with command'
  end

  def run(*args)
    if !args[0].nil?
      cmd = Cli::Commands.find { |e| e.name == args[0] }
      say "#{cmd.name} #{cmd.description}"
    else
      Cli::Commands.each { |value| say "#{value.name} #{value.description}" }
    end
  end
end

class Echo < Cli
  def self.name
    'echo'
  end

  def self.description
    'display a text line'
  end

  def run(*args)
    p (args[0])
  end
end

class Date < Cli
  def self.name
    'date'
  end

  def self.description
    'current time'
  end

  def run(*_args)
    p Time.now
  end
end

class Uptime < Cli
  def self.name
    'uptime'
  end

  def self.description
    'show uptime'
  end

  def run(*_args)
    uptime = `cat /proc/uptime`.split(' ')[0].to_i
    h =  uptime / 3600
    m =  (uptime - h * 3600) / 60
    s = (uptime - h * 3600) % 60
    p "#{h}:#{m}:#{s}"
  end
end

class Ping < Cli
  def self.name
    'ping'
  end

  def self.description
    "get echo request\nexample: ping tut.by"
  end

  def run(*args)
    require 'net/http'
    uri = URI("https://www.#{args[0]}/")
    res = Net::HTTP.get_response(uri)
    if res.is_a?(Net::HTTPSuccess)
      puts 'true'
    else
      puts 'false'
    end
  end
end

def greeting
  user = `whoami`.strip
  hostname = `hostname`.strip
  print user, '@', hostname, ' #cli >> '
end

Cli::Commands.push(Help, Echo, Date, Uptime, Ping)
input_command = ''

def error_log(err)
  f = File.open('error.log', 'a') do |f| # что бы не закрывать файл руками, потому что лень
    f.puts("#{Time.now}:#{err}")
  end
end

begin
  while input_command != 0
    greeting
    input_command = gets.strip.downcase
    Cli.command_by_name(input_command)
  end
rescue RuntimeError => e
  msg = e.message
  error_log(msg)
  retry
rescue NoMethodError => e
  msg = e.message
  error_log(msg)
  retry
rescue Interrupt => e
  msg = 'Good Bye!'
  error_log(msg)
  exit 0
end
