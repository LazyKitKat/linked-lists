require_relative 'lib/list'
a = LinkedList.new
for i in 0..10 
   p a.append(rand(0..15))
end 
puts "Size: " + a.size.to_s
p a.head.to_s
p a.tail.to_s
p a.at(3)