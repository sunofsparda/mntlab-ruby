=begin Main Task 1

  Написать скрипт, который выводит последовательность чисел ​ Фибонначи 
  ­ скрипт должен быть исполняем 
  ­ он должен принимать только один аргумент, указывающий на число элементов в  последовательности 
  Подсказка:  
  ­ используйте массив ARGV, чтобы получить входящие аргументы 
  - не забывайте про циклы
  Пример работы: $ ./script.rb 7  => 0 1 1 2 3 5 8

=end

def fibo(n) 
  a=0
  b=1 
  for i in 0..n 
  c=a+b 
  print "#{c}" 
  a=b 
  b=c 
  end
end

p fibo(10)


=begin Task 2

  Создать переменную для строки "dniMyMdegnahCybuR". 
  Написать  однострочную​  инструкцию, которая поменяет порядок букв на 
  противоположный и понизит все буквы в регистре кроме первой. Вывести  результат. 
  Значение переменной должно быть изменено.	

=end

str = "dniMyMdegnahCybuR"
str = str.reverse.capitalize
puts str



=begin Task 3

  Дано семизначное число.   
  Вывести на экран число, где первая цифра стала  последней, вторая ­ предпоследней и тд. 

=end

number = 1234567
number.to_s.reverse.to_i



=begin Task 4

  Дано целое число. Найти и вывести сумму его цифр.

=end





=begin Task 5
	
  Дана строка. Необходимо подсчитать количество букв "а" в этой строке  (независимо от регистра)
	
=end





=begin Task 6

  Дана строка. Проверить, является ли она палиндромом 

=end





=begin Task 7

  циклом вывести на экран числа от 10 до 3 не влючая 5, причём числа, кратные  3м, вывести в квадрате :) 

=end





=begin Task 8
  
  дан хэш shop = {    milk: 10,    bread: 8,    cornflakes: 12,    ice_cream: 15,    pie: 20  } 
  ответить на вопрос: если ли в магазине какой­либо продукт с ценой в 15? 
  
=end





=begin Task 9
  
  дан массив ar = [1, 6,1,8,2,­1,3,5]. 
  Прибавить 100 к его максимальному элементу:  puts ar  => [1, 6, 1, 108, 2, ­1, 3, 5] 

=end





=begin Task 10
 
  дан массив: ar = [7, 3, [4, 5, 1], 1, 9, [2, 8, 1]]  
  вывести отсортированный по убыванию массив из уникальных элементов  
  начального массива:  puts ar  => [9, 8, 7, 5, 4, 3, 2, 1] 

=end




