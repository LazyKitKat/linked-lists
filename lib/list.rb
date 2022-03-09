require_relative 'node'

class LinkedList 

    attr_accessor :head, :tail

    def initialize
        @head = nil
        @tail = nil
    end

    def append(value)
        new_node = Node.new(value)
        if @head.nil?
            @head = new_node
            @tail = new_node
        else
            @tail.next_node = new_node
            @tail = new_node
        end
    end

    def preappend(value)
        new_node = Node.new(value)
        if @head.nil?
            @head = new_node
            @tail = new_node
        else
            @head = new_node
        end
    end

    def size
        counter = 0
        temp = @head
        until temp == nil
            counter +=1
            temp = temp.next_node
        end
        counter
    end
    def head
        @head.value
    end

    def tail
        temp = @tail
        until temp.next_node.nil?
            temp = temp.next_node
        end
        temp.value
    end
    def at(index)
        count = 0
        temp = @head
        while count < index
            temp = temp.next_node
            count += 1
        end
        temp.value
    end

    def pop
        temp = @head
        until temp.next_node == @tail
            temp = temp.next_node
        end
        temp.next_node = nil
        @tail = temp
    end

    def contains(val)
        temp = @head
        until temp.next_node.nil?
            if temp.value == val
                return true
            end
            temp = temp.next_node
        end
        return false
    end

    def find(val)
        count = 0
        temp = @head
        until temp.next_node.nil?
            if temp.value == val
                return count
            end
            temp = temp.next_node
            count += 1
        end
        return nil
    end

    def to_s
        temp = @head
        until temp.next_node.nil?
            print "( #{temp.value.to_s} ) -> "
            temp = temp.next_node
        end
        p "nil"
    end
end
