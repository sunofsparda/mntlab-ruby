#!/usr/bin/env ruby

=begin
a. Есть 4 ведра, каждое своего цвета: красное, зеленое, синее, жёлтое.
В каждом  лежат шары, определённого количества: 50, 100, 30, 60 соответсвенно.
­ Вывести на экран цвет ведра с максимальны количеством шаров.
­ Вывести на экран ответ на вопрос: больше ли шаров в зеленом ведре
чем в жёлтом или в красном и синем вместе?	
=end







=begin
b. Курс продажи доллара 11170 + 30% сбор.  
­ Вывести на экран, сумму в беларуских рублях, необходимую для покупки 270 долларов 
­ Дать ответ на вопрос: Если у человека есть 5.600.000 беларуских рублей, сколько долларов он может на них купить,
и хватит ли оставшихся рублей на  мороженное (оно стоит 10.000) 
=end

cash = 5600000
currency = 11370
ice_cream = 10000
tax = 0.3

real_currency = currency + currency * tax
usd = (cash / real_currency).to_i
change = (cash - usd * real_currency).to_i

p "1 USD = #{real_currency} BYR (with tax)"
if change >= ice_cream
	p "I will buy #{usd} USD, and have #{change} BYR left, so i can buy ice cream ^_^"
else
	p "I will buy #{usd} USD, and have #{change} BYR left.. I can't buy an ice cream T_T"
end
