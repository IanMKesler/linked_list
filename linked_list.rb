class LinkedList
    require_relative "node"
    attr_accessor :name

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

    

    private

    def create_node(value)
        @number += 1
        node_name = "@node_#{@number}"
        self.instance_variable_set(node_name,  Node.new(value))
        node_name
    end

    
end