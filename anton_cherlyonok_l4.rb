#!/usr/bin/env ruby

class Cli
  COMMANDS = []

  def self.command_by_name(name)
    comm = COMMANDS.find { |value| value.name == name }
    if comm.nil?
      nil
    else
      comm.new.run($first_arg)
    end
  end

  protected

  def say(*args)
    puts "current time: #{Time.now.strftime("%H:%M:%S")}"
    puts "script name: #{$0}"
    puts "#{args[0]}"
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
    if args[0] != nil
      cmd = Cli::COMMANDS.find{|e| e.name == args[0]}
      say "#{cmd.name} #{cmd.description}"
    else
    Cli::COMMANDS.each{|value| say "#{value.name} #{value.description}"}
    end
  end

end


class Echo < Cli

  def self.name
    "echo"
  end

  def self.description
    "display text"
  end

  def run(*args)
    p (args[0])
  end

end

class Date < Cli

  def self.name
    "date"
  end

  def self.description
    "current time"
  end

  def run(*args)
    p Time.now
  end

end









def greeting
  user = `whoami`.strip
  hostname = `hostname`.strip
  print user, "@", hostname, " #cli >> "
end

Cli::COMMANDS.push( Help, Echo, Date ) # Uptime, Ping
input_command = ""

while input_command != "exit"
  greeting
  input_command = gets.strip.downcase
  Cli.command_by_name(input_command)

end





