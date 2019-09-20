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
            return node if count == index
            count += 1
        }
        traverse(proc) if @head
        return false
    end

    def pop
        length = size
        count = 0
        proc = Proc.new { |node|
            count += 1
            if count == length-1 
                temp_link = node.next_node.dup
                node.next_node.value = nil
                node.next_node = nil
                @tail = node
                return temp_link
            end                
        }
        traverse(proc) if @head
        return false
    end

    def contains?(value)
        proc = Proc.new { |node|
            return true if node.value == value
        }
        traverse(proc) if @head
        return false
    end

    def find(value)
        count = 0
        proc = Proc.new { |node|
            return count if node.value == value
            count += 1
        }
        traverse(proc) if @head
        return nil
    end

    def to_s
        proc = Proc.new { |node|
            print "( #{node.value} ) -> "
        }
        traverse(proc) if @head
        print "nil"
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