#!/usr/bin/env ruby
p self
def say
  p 'ss'
end

class A
  p self

  def say
    p self
  end
end
say
#self.say

###############
def say(aj)
  puts aj.class
end

def y
  puts 'y'
  1
end

#y = proc { puts 'y'; 1}
say(y)
y = proc { puts 'y'; 1}
say(y)

#start server.set_ip 1.1.1.1 # start server.set_ip (1.1.1.1)

def xxx
  if true
    puts '1'
    2 # return 2 # если есть return, то выходит сразу из метода
    #...
  else
    1
    #...
    # return 1
  end
  #...
end
xxx



###########################################
def xxx
  return 1 if valid?
  puts '1'
  2
end
####################################
def yyy
  if valid
    1
  else
    puts '1'
    2
  end
end
###########################################

#ruby -c hello.rb # check syntax

a = 1
def xxx(a,b,c)
  a # тут будет другая 'a', не та которая перед def xxx, а та которую передали
end
# a = 1 # на выходе из def xxx, 'a' будет такая же как была задана раньше 'a = 1'



#LOG_LEVEL
p = proc { |g| puts g}
def xxx
  a
end
# a = 1

a = 1
x = Proc.new { p a } # тоже что и  p = proc { p a } - синтаксический сахар
x = proc { p a }
x = proc { |g| p [g, a] }
x.call(10)
a = 10
x.call(10,10)

###
def x(g)
  a = 1
  p [ g, a ]
end

def x( b, a = 1) # значение по умолчанию # (a = 1, b) - нельзя
  p a
end

####################### перегрузка
def x()
  p a
end

def x(a)
  
end

def x(a, b)

end

def x(*args)
  p args
end
x(1,2,3,4,5,6,7,8,9,10)

def x(a, b, c = 1, *args)
  p args
end
x(1,2,3,4,5,6,7,8,9,10)
########################## /перегрузка


########################## именованные методы
def y(a:)
  puts a
end
y(a: 1)

def y(a:, b:)
  p [a, b]
end
y(a: 1, b: 2)
y(b: 1, a: 2) #порядок передачи неважен, так как передача по имени


def y(a:, b: 1)
  p [a, b]
end
y(a: 1, b: 444)


def y(a:, b: 1, **kwargs) # kwargs будет hash
  p [a, b, kwargs]
end
y(a: 1, b: 444, e: 1, z: '10')
#output: [1, 444, {:e=>1, :z=>"10"}]


# супер метод. смешивание.
def x(a, c = 1, *args, x:, z: 1, **kwargs)
  p [a, c, args, x, z, kwargs]
end
x(1,2, 1,2,3,4,5, x: 1, y:1)
# [1, 2, [1, 2, 3, 4, 5], 1, 1, {:y=>1}]

########################## /именованные методы

########################## блок
def x
  if block_given?
  yield # автоматичксик вызывает блок
  end
  p '111'
end
x
x do
  puts 1
end

x { puts 1 }

####
def x(&block)
  p block
  if block_given?
    return yield # автоматичксик вызывает блок
  end
  p '111'
end
x
x do
  puts 1
end

x { puts 1 }
####
def x(&block)
  p block
  if block_given?
    return yield # автоматичксик вызывает блок
  end
  p '111'
end
x
x do
  puts 1
end

x { puts 1 }


# супер метод 2. смешивание.
def x(a, c = 1, *args, x:, z: 1, **kwargs, &block)
  p [a, c, args, x, z, kwargs, block]
end
x(1,2, 1,2,3,4,5, x: 1, y:1)
# [1, 2, [1, 2, 3, 4, 5], 1, 1, {:y=>1}]


# x { 1 } = x() { 1 }
########################## /блок


########################## <name>
def x(a)
  p a
end
x({ a:1 })
x( a: 1 )
x a: 1

def y(a)
  p a  
end
########################## </name>

########################## <name>
def x(a)
  a.size  
end
########################## </name>

########################## <объектная модель>
def x(a)
  a.size  
end
########################## </объектная модель>


########################## <типы>
# Object - отвечает за объекты, создает объекты
# Class - отвечает за классы, создает классы. Все methods хранятся в class
# Module - отвечает за модули, создает модули
########################## </типы>

########################## <name>
class String
  def t
    self.upcase!
  end
end
p a = 'qwerty'
p a.t
########################## </name>

########################## <name>
'1'.class == Integer
'1'.is_a?(Integer)
'1'.is_a?(String)
Integer.object_id
Integer.class

String.new('asdf')
# '1'.new - сделать нельзя
########################## </name>

########################## <name>
class Mtn
  def initialize
    puts 'init'
    puts self
  end
end
m = Mtn.new
puts m

class Mtn
  def initialize(a)
    puts 'init', a
    puts self
  end
end
m = Mtn.new(1)
puts m
########################## </name>


########################## <instance vars>
class Mtn
  def initialize(a)
    @state = a # живет пока живёт объект
  end

  def state
    @state
  end
end
m = Mtn.new(1)
p m
m2 = Mtn.new(666)
p m2.state

###
class Mtn
  def initialize(a)
    @state = a # живет пока живёт объект
  end

  def state
    @state
  end

  def state=(a)
    @state = a
  end
end
m = Mtn.new(1)
p m
m2 = Mtn.new(666)
m2.state = 2 # m2.state=(2)
p m2
p m2.state
####

class Mtn
  def initialize(a)
    @state = a # живет пока живёт объект
  end
  attr_reader :state
  attr_writer :state
end
m = Mtn.new(1)
p m
m2 = Mtn.new(666)
m2.state = 2 # m2.state=(2)
p m2
p m2.state
####
class Mtn
  def initialize(a)
    @state = a # живет пока живёт объект
  end
  attr_accessor :state
end
m = Mtn.new(1)
p m
m2 = Mtn.new(666)
m2.state = 2 # m2.state=(2)
p m2
p m2.state
####
class Mtn
  attr_accessor :state, :port, :ip
  def initialize(a)
    @state = a # живет пока живёт объект
  end
end
m = Mtn.new(1)
p m
m2 = Mtn.new(666)
m2.state = 2 # m2.state=(2)
m2.port = 8080
m2.ip = '127.0.0.1'
p m2
p m2.state

########################## </instance vars>



########################## <class vars>
class Mtn
  def self.xxx(a)
    @@state = a
  end

  def xxx
    p [@state, @@state]
  end

  def initialize(a)
    @state = a
  end
end
Mtn.xxx(1)
m = Mtn.new('m')
m.xxx
m2 = Mtn.new('zzz')
m2.xxx
Mtn.xxx('aaa')
m.xxx
m2.xxx
########################## </class vars>


########################## <name>
class A
  def x
    p 'A'    
  end
end

class Mtn1 < A
  def x
    p 'Mtn'
  end
end

a = A.new
m = Mtn1.new
p a.is_a? Mtn1
########################## </name>

########################## <name>
RUBY_COOL = 1
class A
  def x
    p 'A'    
  end
end

class Mtn1 < A
  def x
    p 'Mtn'
  end

  def print
    p RUBY_COOL    
  end
end

########################## </name>



