require_relative "node"
require_relative "linked_list"

list = LinkedList.new
list.prepend(42)
list.append("The answer")
puts list.size
puts list.contains?(42)
puts list.contains?("The answer")
puts list.contains?(19)
puts list.find(42)
puts list.find("The answer")
puts list.find(19)
list.to_s
gets