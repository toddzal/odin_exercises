class LinkedList
    def initialize
        @head = nil
        @tail = nil       
    end
    def head
        return @head.value
    end
    def tail
        return @tail.value
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
        node = @head
        if !@head #No Head
            puts "List is empty "
            return 
        elsif @head == @tail
            @head = nil
            @tail = nil
        else #Head exists
            while (node = node.next_node)
                if node.next_node.next_node == nil
                    node.next_node = nil
                end
            end
        end
    end
    def contains?(val)
        node = @head
        if !@head #No Head
            return false
        elsif val == @head.value
            return true
        else #Head exists
            while (node = node.next_node)
                if node.value == val
                    return true
                end
            end
        end
        return false
    end
    def find(val)
        counter = 1
        node = @head
        if !@head #No Head
            return nil
        elsif val == @head.value
            return 1
        else #Head exists
            while (node = node.next_node)
                if node.value == val
                    return counter
                end
                counter += 1
            end
        end
        return nil
    end
    def to_s
        catcher = " ( #{@head.value} ) -> "
        node = @head
        if !@head #No Head
            return "Empty List"
        else #Head exists
            while (node = node.next_node)
                catcher += "( #{node.value} ) -> "
            end
        end
        return catcher += "nil"
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
puts "Val at index 3 is " + list.at(3).to_s
puts "Size is " + list.size.to_s
puts "the head is " + list.head.to_s
puts "the tail is " + list.tail.to_s
puts "Contains the number 20: #{list.contains?(20)}"
puts "Contains the Character 'X': #{list.contains?("X")}"
puts "At what index is the value 10 found: #{list.find(10)}"
puts list.to_s
list.pop
puts list.to_s