#!/usr/bin/env ruby

class A
  include Enumerable

  attr_reader :items
  
  # def items
  #   @items
  # end

  def initialize
    @items = []
  end

  def add(item)
    items << item
  end

  def to_s
    items.join(", ")
  end

  def each(&block) # to use '.each'
    items.each(&block)   
  end

  # def <=>(old, new) # compare
  #   1
  #   -1
  #   0
  #   old.size > new.size
  # end

end

a = A.new
a.add("a")
a.add("b")
a.add("c")
puts a.each {|f| p f}
puts a.map {|f| "---- #{f} ----" }

