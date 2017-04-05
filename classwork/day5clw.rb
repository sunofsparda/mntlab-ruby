#!/usr/bin/env ruby

brline = '=' * 20
num = 0
topic = ''
#################### 

class A
  def self.run
    'A'   
  end
  def self.name
    'A'    
  end
end

class B
  def self.run
    'B'   
  end
  def self.name
    'B'    
  end
end

class C
  def self.name
    'C'    
  end
end


class Run
  CMDS = [A, B]

  def self.find(name)
    A if name == 'A'
    B if name == 'B'   
  end
end


p Run.find('B').run
puts [A].find { |c| c.name == 'A'}
puts [A].find { |c| c.name == 'A'}.name
puts [A].find { |c| c.name == 'B'}



######################

def x(w)
  puts gets
  puts gets if w
  puts 'end'
end

x(true)

x(false)

######################
  

puts "Day 5 #{brline} Наследование block #{num += 1}"

class Z
  p "Z"
end

class F < Z # class F наследуется от Z
  #code
end

#################### 
puts "Day 5 #{brline} Вложенные классы block #{num += 1}"

class Mtn
  p "Mtn"
end

module V
  class Mtn
    p "V::Mtn"
  end # V::Mtn
end

Mtn
V::Mtn
#A.new

#################### 
puts "Day 5 #{brline} Модули block #{num += 1}"

class Mtn
  def x
    'mtn original'
  end
end

module M
  class Mtn
    def x
      'mtn module'
    end
  end
  p Mtn.new.x
end

p Mtn.new.x

#################### 
puts "Day 5 #{brline} подмена стандартной библиотеки block #{num += 1}"

# class Array
#   def size
#     p self.length.to_s # подмена стандартной библиотеки. mokey patching
#   end   
# end

# [1,2,3].size
# [1].size + 9 # ./module.rb:64:in `+': no implicit conversion of Integer into String (TypeError)


module Rails
  class Array < Array
    def size
      p self.length.to_s # подмена стандартной библиотеки. mokey patching
    end   
  end
end

p Array.new([1,2,3]).size
p Array.new([1]).size + 9

module Rails
  p Array.new([1,2,3]).class.ancestors
end

#################### 
puts "Day 5 #{brline} подмена стандартной библиотеки block #{num += 1}"

class Mtn
  def x
    'mtn original'
  end
end

module M
  def y
    p 'y from module M'    
  end
  
  def self.z
    p 'self.y from module'
  end
end

module M2
  def y
    p 'y from module M2'    
  end
  
  def self.z
    p 'self.y from module'
  end
end

class Mtn
  include M # все instance методы добавляет как instance методы класса
  extend M2 # делает как классовые методы
end

Mtn.new.y # include
Mtn.y # extend
p Mtn.ancestors

class Mtn
  prepend M2 # делает как include но
end

Mtn.new.y # include
Mtn.y # extend
p Mtn.ancestors

#################### 
puts "Day 5 #{brline} Подрузка библиотек block #{num += 1}"

# require_relative '' # ищет локально относительно места где вызывается скрипт
# require '' # ищет по $rubypath
# load ''


#################### 
puts "Day 5 #{brline} Исключения и обработка исключений block #{num += 1}"

begin
  1 / 0
  puts 'after error' # выполняться не будет
rescue StandardError # rescue по умолчанию отлавливает StandardError. StandardError можно не писать
  puts 'error'
end
puts 'end'

###

begin
  1 / 0
  1 + '1'
  puts 'after error' # выполняться не будет
rescue ZeroDivisionError => exc
  p '-' * 50
  p exc.backtrace
  p exc.message
  p '-' * 50
rescue TypeError => exc
  p '-' * 50
  p exc.backtrace
  p exc.message
  p '-' * 50
rescue => exc
  p '-' * 50
  puts 'error'
  p exc.backtrace
  p exc.message
  p '-' * 50
end

###

begin
  1 / 0
  1 + '1'
  puts 'after error' # выполняться не будет
rescue TypeError, ZeroDivisionError => exc
  p '-' * 50
  p exc.backtrace
  p exc.message
  p '-' * 50
rescue => exc
  p '-' * 50
  puts 'error'
  p exc.backtrace
  p exc.message
  p '-' * 50
end

###

begin
  1 + '1'
  puts 'after error' # выполняться не будет
rescue TypeError, ZeroDivisionError => exc
  p '-' * 50
  p exc.backtrace
  p exc.message
  p '-' * 50
end

def x(a)
  1 / a
rescue ZeroDivisionError => e
  p e.message
end
x(0)
x(1)
puts 'end'

###

begin
  1 + '1'
  puts 'after error' # выполняться не будет
rescue TypeError, ZeroDivisionError => exc
  p '-' * 50
  p exc.backtrace
  p exc.message
  # raise exc # вызов последней ошибки
  # raise StandardError.new('Hacker') # StandardError.new - подмена exception на любой произвольный
  # output => ./day5clw.rb:279:in `rescue in <main>': Hacker (StandardError)
  p '-' * 50
end

###

=begin
использовать StandardError не лучший вариант
best practice: создать свой класс ошибки с наследованием от Standard Error
  class My_Error < StandardError
  <code>
  end  
=end

class My_Error < StandardError
  def message
    'My Error'  
  end
end

begin
  1 + '1'
  puts 'after error' # выполняться не будет
rescue TypeError, ZeroDivisionError => exc
  p '-' * 50
  p exc.backtrace
  p exc.message
#  raise My_Error.new('my custom error')
  p '-' * 50
end

###

class My_Error < StandardError
  def message
    'My Error'  
  end
end

begin
  1 + '1'
  puts 'after error' # выполняться не будет
rescue TypeError, ZeroDivisionError => exc
  p '-' * 50
  p exc.backtrace
  p exc.message
#  raise My_Error.new('my custom error')
  p '-' * 50
end

1.times do |i|
  begin
    puts i
    sleep(1)
  rescue Exception => e # лучше НЕ использовать, невозможно выйти из скрипта ctrl+c
    puts "NAH"
  end
end

###

class My_Error < StandardError
  def message
    'My Error'  
  end
end

begin
  1 + '1'
  puts 'after error' # выполняться не будет
rescue TypeError, ZeroDivisionError => exc
  p '-' * 50
  p exc.backtrace
  p exc.message
  p '-' * 50
ensure # выполняется всегда, даже если программа упала
  puts 'ensure'
end

###

file_name = 'wrong'
begin
  puts '*' * 30
  puts "open #{file_name}"
  puts IO.read(file_name)
rescue Errno::ENOENT => e
  puts 'file not found'
  file_name = 'q.rb'
  retry
end
puts 'finished'

###

# Task:
# logger { puts 1}
# "1"
# => nil

# logger { 1/0 }
# "Some Error: Zero"
# => nil

def logger #(&block)
  yield
  nil
rescue StandardError => e # or 'rescue => e', но дзен говорит "Явное лучше чем неявное", так что лучше 'rescue StandardError => e'
  puts "Some Error: #{e.class}"
  puts "Some Error: #{$!.class}" # последний exception хранится в $!
  nil
end

logger { puts 1 }
logger { 1/0 }




#################### 
puts "Day 5 #{brline} Работа с файлами block #{num += 1}"

# open, modify, close!
IO.read('config.yaml') 

### Перенаправление потоков
# require logger
# write('string')

# File.delete('stdout.log') if File.exists?('stdout.log') # проверка на существование и удаление если есть
# k = $stdout
# $stdout = File.open('stdout.log', "w")
# puts 1
# puts 'hello world'
# k.close

###
std = $stdin
$stdin = File.open('stdout.log')
puts 'hello world'
x = gets
puts x
x = gets
puts x
std.close

###
f = File.open("config.yaml")
puts f.read
puts f.read
f.close
###
File.delete('write.txt') if File.exists?('write.txt') # проверка на существование и удаление если есть
f = File.open('write.txt', "w")
f.write('hello world')
f.close


f = File.open('write.txt', "a")
f.write('sprint is cool')
f.close


f = File.open('write.txt', "a")
f.write("\nfrom new line")
f.close

f = File.open('write.txt', "a") # "w" - перезапишет
f.puts("1 sprint is cool")
f.puts("2 sprint is cool") # puts writes \n at the end of the line
f.close

f = File.open('write.txt', "a") do |f| # что бы не закрывать файл руками, потому что лень
f.puts("q sprint is cool")
end


f = File.open('config.yaml').each do |l|
  p l
  p l.chomp # что бы избежать \n
end


###

f = File.open('config.yaml')
while (l = f.gets.chomp) && l != 'email:'
  p l
end

###

f = File.open('write.txt', 'w') do |f|
  f.puts('q')
end

#################### 
puts "Day 5 #{brline} подсчёт '#' строк в config.yaml block #{num += 1}"
puts File.open('config.yaml').count{|line| line.start_with?("#")  }


#################### 
puts "Day 5 #{brline} работа с FS block #{num += 1} \n Dir"
puts Dir.glob('*')

#################### 
puts "Day 5 #{brline} работа с FS block #{num += 1} \n FileUtils"
require 'fileutils'
FileUtils.touch('fff.txt')


#################### 
puts "Day 5 #{brline} работа с FS block #{num += 1} \n Pathname"
require 'pathname'
p Pathname.pwd
puts File.expand_path('.')

#################### 
puts "Day 5 #{brline} работа с Внешними утилитами block #{num += 1} \n"
`ls -la` # возращает в stdout
c = '-a'
`ls #{c}`
%x(ls -a)
%w(fqwe qweqwe qwewq)

#################### 
puts "Day 5 #{brline} работа с Внешними утилитами block #{num += 1} \n метод system"
s = system('ls -a')
puts s
s = system('xxxa')
puts s
s = system('exit 1')
puts s

exec("ls -a")

#################### 
puts "Day 5 #{brline} работа с Внешними утилитами block #{num += 1} \n module open3"

# require 'open3'
# cmd = 'ping google.com'
# Open3.popen3(cmd) do | stdin, stdout, stderr, wait |
#   status = wait.value
#   unless status.success?
#     abort 'ffdf'    
#   end
# end

system("echo", "123")
system("ls", "arg")
system("echo #{arg}") # DO NOT DO LIKE THIS!!! EXPLOTIT!!!







p 'EXIT 0'