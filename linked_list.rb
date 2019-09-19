class LinkedList
    require_relative "node"

    attr_reader :head, :tail

    def initialize
        @head = nil
        @tail = nil
        @number = 0
    end

    def append(value)
        node_name = create_node(value)
        if @tail
            @tail.next_node = self.instance_variable_get(node_name)
            @tail = self.instance_variable_get(node_name)
        else
            @head = self.instance_variable_get(node_name)
            @tail = self.instance_variable_get(node_name)
        end
    end

    def prepend(value)
        node_name = create_node(value)
        if @head
            self.instance_variable_get(node_name).next_node = @head
            @head = self.instance_variable_get(node_name)
        else
            @head = self.instance_variable_get(node_name)
            @tail = self.instance_variable_get(node_name)
        end
    end

    def size
        count = 0
        proc = Proc.new { |node| 
            count+=1
        }
        traverse(proc) if @head
        count
    end

    def at(index)
        count = 0
        proc = Proc.new { |node| 
            count += 1
            return node if count == index+1
        }
        traverse(proc) if @head
        return false
    end



    private

    def create_node(value)
        @number += 1
        node_name = "@node_#{@number}"
        self.instance_variable_set(node_name,  Node.new(value))
        node_name
    end

    def traverse(proc, node = @head)
        proc.call(node)
        traverse(proc, node.next_node) if node.next_node      
    end

    
end