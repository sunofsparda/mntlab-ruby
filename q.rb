#!/usr/bin/env ruby
class A
  def x
    p 'A'    
  end
end

class Mtn < A
  def x
    p 'Mtn'
  end
end

a = A.new
m = Mtn.new
p a.is_a? Mtn
    