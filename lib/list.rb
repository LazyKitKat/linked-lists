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


    def insert_at(val, index)
        count = 0
        ref_node = @head
        if index == 0
            preappend(val)
        else

            while count < (index - 1)
                ref_node = ref_node.next_node
                count += 1
            end
           
            node_after = ref_node.next_node
            node_before = ref_node
            new_node = Node.new(val, node_after)
            node_before.next_node = new_node
            @tail = new_node if node_after.value.nil?
        end
    end

    def remove_at(index)
        ref_node = @head
        count = 0
        if index == 0
            @head = ref_node.next_node
        else
            while count < (index - 1)
                ref_node = ref_node.next_node
                count += 1
            end
            remove_node = ref_node.next_node
            before_node = ref_node
            new_after_node = remove_node.next_node
            before_node.next_node = new_after_node
            @tail = ref_node if new_after_node.value.nil?
        end
    end 
end
