require_relative "node"
require_relative "linked_list"

list = LinkedList.new
list.prepend(42)
#list.prepend("The answer")
puts list.size
puts list.at(0).value
gets