#!/usr/bin/env ruby

brline = '=' * 20
num = 0
topic = ''
####################
puts "#{brline} Block 1"

a = 101
case a
when (1..100)
  p 'first'
when Integer, Float
  p '2'
when String
  p 's'
end

####################
puts "#{brline} Block 2"

b = 10
case a # with a and without a 
when a > 5
  p '>10'
when a < 100
  p '<100'
else
  p 'else'
end		

####################
puts "#{brline} Block 3"

c = 10
xxx = case a
when String
  'string'
when Array
  'array'
else
  puts '*' * 20
  p '10'
end


####################
puts "#{brline} Block 3"

p 0.1 + 0.2 
p (Rational(1,10) + Rational(2,10)).to_f
p 1.upto(10) { |i| p i}

####################
puts "#{brline} Block 3"

p 5.methods.size
p 5.methods

####################
puts "#{brline} Block 3"

p 1.to_s

####################
puts "#{brline} Block 3"

p 'ruby'.capitalize.downcase.upcase[1, 2].reverse.size

####################
puts "#{brline} Task #{num += 1}"

puts "hello #{1 + 2} world"

####################
puts "#{brline} Task #{num += 1}"

# s[5] = 'X'
# b = s
# c = b.clone

a = <<SQL
select * from users;
select count(1) from users;
SQL

####################
puts "#{brline} Task #{num += 1}"
# Символы :symbol неизменяемые
p :abc_qwe 
p a = :start

p s1 = 's'
p s2 = 's'
p s1.object_id
p s2.object_id
# id разные

x1 = :s
x2 = :s
x1.object_id
x2.object_id
# id одинаковые
puts '=' * 20

####################
p :s.methods.size
p 's'.methods.size
puts '=' * 20

####################
#Массивы расширяемы
a = []
a << 1
a << 2
p a
p a.size

p a = [1, 's',[1], [2, [3]], nil, true]
p a[0]
p a[1, 3]  #откуда, сколько
p a[1..3] #откуда по какой
p a[3][1][0]
puts '=' * 20

####################
# пустота заполняется nil'ом
b = []
b[1] = 1
p b
b[100] = 1
p b
puts '=' * 20
b.compact # удаляет nil из массива
p b
b.delete(2) # удаляет значение
p b
b.delete_at(2) # удаляет по индексу
p b
# << меняет оригинальный массив
# + конкотенация

b.join(" - ")
p b
puts '=' * 20

####################
def xxx?
  1 == 2
end

####################
p s = "he2l1lo m5y cr1u2el worl123d"
p s.upcase
s = s.upcase # удаляет старый и создает новый
p s.upcase! # изменяет оригинал

####################
def idx!(a, i)
  raise if a.size - 1 < i
  a [i]
end
p idx!([2],0)
puts '=' * 20

####################
h = {}
h['cdd' => 1]
h['cdd'] = 1
h
h["cdd"]
h["cdadsda"]
h = {a: 1, b: 2} # символ не создает объекта в памяти
h = {a: [1], 'b': nil}
a = {a: 1}
b = {a: 2}
puts '=' * 20

####################
p h = {a: 1, qwe_asd: 5}
p h = {a: 1, "a" => 2}
p h[:a]
p h["a"]
p h = Hash.new(1000)
puts '=' * 20

#################### Диапазоны
(1..10) # от чего до чего
(1...10) # ... последний символ не включается
(1..10) === a
#true
(1...10) === 111
#false

case a
when (1..10) then p 1
when (11..100) then p 2
else
  p 'more then 100'
end

if 1 == 1 then p '1'
end

h.each { |k,v| p k, v}
h.each do |k,v|
  p k
  p v
end

(1..10).to_a
('a'..'z').to_a
p ('ぁ'..'ん').to_a
p ('ァ'..'ヿ').to_a

puts '=' * 20

####################ン
h = {a: 1, b: 2, c: 3, '3': 2}
p h.invert[2]

puts '=' * 20

#################### Regexp
# /\d+W =~ "23"
# /\d+W =~ "12fqweds3"
# /\d+W =~ "12Wfasdgrtd3"
# /\d+W =~ "12Wfasdgrtd3"
# "12Wfasdgrtd3" =~ /\d+W 

# puts '=' * 20

#################### # поставить # бесконечного цикла
loop do
  puts '=' * 20 
  break # 987
  end

puts '=' * 20

####################
for i in a
  p i
end

puts '=' * 20

#################### redo повторить круг не заходя в условие
i = 0
while i != 8
  p i
  i += 1
  redo if i == 4
end

puts "\n"

x = 0
while x < 10
  x += 1
  redo if x == 6 
  puts x
end

puts '=' * 20

####################
a = 0
i = 0
while a < 10
  puts a
  i += 1
  redo if a == 4 && i < 10
  a += 1  
end

puts '=' * 20

####################
puts "#{brline} Block 3"

# a.each_with_index do |e, x|
#   p [e, x]
#   end

#################### collect / map
puts "#{brline} #{topic} block #{num += 1}"

# a.map do |e|
#   puts e
#   1 == 2
#   e + "xxxx"
# end

####################
puts "#{brline} #{topic} block #{num += 1}"

a = ['axxxx', 'bxxxx', 'cxxxx', 'dxxxx', 'exxxx']
x = a.find do |e|
  e == 'dxxxx'
  puts e
end

x = a.find do |e|
  e == 'dxxxx'
end

####################
puts "#{brline} #{topic} block #{num += 1}"
a = [2,4,6,8,4,2,2,4]
a.any? { |e| e.even?}
a.any? { |e| e.odd?}
a.all? { |e| e > 5 }
[].size == 0
[].any?
[nil].any?
[nil, false].any?
[].all?
[1].all?

####################
puts "#{brline} #{topic} block #{num += 1}"
a = [2,4,6,8,4,2,2,4]

# a.inject([]) do |e, memo|
#   memo << e if e > 5}
# end

sum = 0
a.each do |e|
  sum = sum + e
end
p sum
# or
p a.inject(0) { |e, sum| sum + e }
p a.inject({}) {|memo, e| memo[e.to_s] =e ; memo}


####################
puts "#{brline} #{topic} block #{num += 1}"

def aaa
  yield
end
#p aaa
p aaa {puts 1}

####################
puts "#{brline} #{topic} block #{num += 1}"

p a = %w(a b c d e f)
p a.map { |e| e.upcase }
p a.map(&:upcase)
p a.map(&:size)


#################### 
puts "Day 4 #{brline} #{topic} block #{num += 1}"


def say #если без передачи аргумента, то скобки можно не писать
  puts 'say'
end

x = def aa
end

#символы можно конвертировать в proc
# 2.4.1 :002 > class A
# 2.4.1 :003?>   p self
# 2.4.1 :004?>   def say
# 2.4.1 :005?>     p self
# 2.4.1 :006?>     end
# 2.4.1 :007?>   end
# A
#  => :say 
# 2.4.1 :008 > a

