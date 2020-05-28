class LinkedList
    def initialize
        @head = nil
        @tail = nil       
    end
    def head
        return @head
    end
    def tail
        return @tail
    end
    def at(num)
        counter = 1
        node = @head
        if !@head #No Head
            return "Linked List is currently empty"
        else #Head exists
            if num > self.size
            elsif num == 1
                return node.value
            else
                while (node = node.next_node)
                    if num == counter
                        return node.value
                    end
                    counter += 1
                end
            end
        end
    end

    def append(value)
        #Has the head been populated
        new_node = Node.new(value)
        if @head #Is populated
            @tail.next_node  = new_node
            @tail = new_node
        else #is NOT populated
            @head = new_node
            @tail = new_node
        end
    end
    def prepend(value)
        #Has the head been populated
        new_node = Node.new(value)
        if @head #Is populated
            new_node.next_node  = @head
            @head = new_node
        else #is NOT populated
            @head = new_node
            @tail = new_node
        end
    end
    def size
        counter = 1
        node = @head
        if !@head #No Head
            return 0
        else #Head exists
            while (node = node.next_node)
                counter += 1
            end
        end
        return counter
    end
    def pop 
    end
    def contains?
    end
    def find
    end
    def to_s
    end

end

class Node
    attr_accessor :value, :next_node
    def initialize(value = nil, next_node = nil)
        @value = value
        @next_node = next_node
    end

end

list = LinkedList.new
list.append(10)
list.append(20)
list.prepend(5)
list.prepend(3)
list.prepend(4)
p list.at(3)
p list.size