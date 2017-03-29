#!/usr/bin/env ruby

a = 101
case a
when (1..100)
  p 'first'
when Integer, Float
  p '2'
when String
  p 's'
end
puts '=' * 20


b = 10
case a # with a and without a 
when a > 5
  p '>10'
when a < 100
  p '<100'
else
  p 'else'
end		
puts '=' * 20


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
puts '=' * 20


p 0.1 + 0.2 
p (Rational(1,10) + Rational(2,10)).to_f
p 1.upto(10) { |i| p i}
puts '=' * 20


p 5.methods.size
p 5.methods
puts '=' * 20

p 1.to_s
puts '=' * 20

p 'ruby'.capitalize.downcase.upcase[1, 2].reverse.size
puts '=' * 20

puts "hello #{1 + 2} world"
puts '=' * 20

# s[5] = 'X'
# b = s
# c = b.clone
# puts '=' * 20

a = <<SQL
select * from users;
select count(1) from users;
SQL

puts '=' * 20

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

p :s.methods.size
p 's'.methods.size
puts '=' * 20

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