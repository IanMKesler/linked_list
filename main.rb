require_relative "node"
require_relative "linked_list"

list = LinkedList.new
list.prepend(42)
list.append("The answer")
list.insert_at("The question", 0)
list.to_s
puts
list.remove_at(0)
list.to_s
puts
list.remove_at(1)
list.to_s
puts
list.remove_at(0)
list.to_s
puts