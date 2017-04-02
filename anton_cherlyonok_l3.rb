=begin

  написать метод, который принимает аргументом объект типа Proc
  и возвращает  время затраченное на выполнение данного прока(примитивный бенчмаркинг).
  Текущее время можно узнать с помощью Time.now  

=end





=begin

  дан массив: array = [1, 2, 3, 4]. 
  Написать метод mega_sum, который  
  поддерживает следующее использование: 
  ­ mega_sum(array) # => 10 # простая сумма элементов  
  ­ mega_sum(array, 10) # => 20 # сумма всёх элементов + переданное  значение  
  ­ mega_sum(array) { |i| i ** 2} => 30 # сумма элементов с применённым  блоком  
  ­ mega_sum(array, 10) { |i| i **2} => 40 # сумма элементов с применённым  блоком + переданное значение  
  Это всё один метод! 

=end





=begin

  В диапазоне от 1 до 1_000, найти первое трёх­значное число 
  у которого остаток  деления на 7 равен 3

=end





=begin

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





=begin

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




