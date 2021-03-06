#!/usr/bin/env ruby

=begin Task 1

  написать метод, который принимает аргументом объект типа Proc
  и возвращает  время затраченное на выполнение данного прока(примитивный бенчмаркинг).
  Текущее время можно узнать с помощью Time.now  

=end

def benchmark(task)
  start_time = Time.now
  task.call
  end_time = Time.now
  puts "#{end_time - start_time}"
end
task = proc {sleep(1)}
benchmark(task)



=begin Task 2

  дан массив: array = [1, 2, 3, 4]. 
  Написать метод mega_sum, который  
  поддерживает следующее использование: 
  ­ mega_sum(array) # => 10 # простая сумма элементов  
  ­ mega_sum(array, 10) # => 20 # сумма всёх элементов + переданное  значение  
  ­ mega_sum(array) { |i| i ** 2} => 30 # сумма элементов с применённым  блоком  
  ­ mega_sum(array, 10) { |i| i **2} => 40 # сумма элементов с применённым  блоком + переданное значение  
  Это всё один метод! 

=end

array=[1, 2, 3, 4]
def mega_sum(array, var=0)
  if block_given?
    array.inject(0) { |sum, i| sum + yield(i) } + var
  else
    array.inject(0) { |sum, i| sum + i } + var
  end
end
p mega_sum(array)
p mega_sum(array, 10)
p mega_sum(array) { |i| i ** 2}
p mega_sum(array, 10) { |i| i **2}



=begin Task 3

  В диапазоне от 1 до 1_000, найти первое трёх­значное число 
  у которого остаток  деления на 7 равен 3

=end

puts (1..1000).detect{|value| (value % 7 == 3) && (value.to_s.size == 3)}



=begin Task 4

  Написать метод, с двумя именнованными аргументами, 
  а всеми остальными ­ не  обязательными (не ограничено количеством). 
  Если за методом следует блок, то  вызвать его на каждом из не обязательных аргументов,
  если же блок не следует  ­ вывести ‘ERROR”. 
  Пример:  
  method_name(...) # => "ERROR"  
  method_name(..., 1, 2, 3) {|i| puts i}  
  1  
  2  
  3  
  => nil

=end

def method_name(arg1, arg2, *args)
  if block_given?
    args.each do |i|
      yield(i)
    end
  else
    p "ERROR"
  end
end
method_name(1, 2, 3, 4, 5)  {|i| puts i}



=begin Task 5

  Апгрейд стандартной библиотеки. Мы напишем метод, который будет
  возвращать все чётные числа, соответсвующие переданному в блок условию:
  Чтобы это работало, делаем так: 
  class Array 
    def  ваш_метод
      < code >
    end
  end

  puts [1, 2, 3, 4, 5, 6, 7].ваш_метод { |i| i > 2}.inspect # => [4, 6]
  puts [1, 2, 3, 4, 5, 6, 7].ваш_метод { |i| i > 10}.inspect # => nil
  puts [2, 4, 6, 8, 10, 12, 7].ваш_метод {|i| i.between?(6, 12)}.inspect # => [6, 8, 10, 12]
   
=end

class Array
  def find_even
    self.select{|n| yield(n) if n.even? }
  end
end

puts [1, 2, 3, 4, 5, 6, 7].find_even { |i| i > 2}.inspect # => [4, 6]
puts [1, 2, 3, 4, 5, 6, 7].find_even { |i| i > 10}.inspect # => nil
puts [2, 4, 6, 8, 10, 12, 7].find_even {|i| i.between?(6, 12)}.inspect # => [6, 8, 10, 12]
