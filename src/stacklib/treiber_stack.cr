class Stack(T)
    class Node(T)
        @value : Int32 | Nil 
        @next : Node(T) | Nil  

        def initialize
        end 

        def initialize(@value : Int32, @next = nil) 
        end 

        def value 
            @value 
        end
        
        def next 
            @next 
        end 

        def set_next(node : Node(T) | Nil)
            @next = node 
        end 
    end 


    @top : Node(T)? 

    def initialize 
        @top = nil 
    end 

    def top 
        @top 
    end 

    def compare_and_swap(expected, to_add) 
        tmp = @top 
        if tmp == expected 
            @top = to_add
            return true
        else 
            return false
        end 
    end 

    def push(value : Int32)
        if @top.nil? 
            @top = Node(T).new(value)              
        else 
            while true 
                to_add = Node(T).new(value)              
                top_tmp = @top 
                to_add.set_next(top_tmp)
                if (compare_and_swap(top_tmp, to_add))
                    return 
                end  
            end            
        end 
    end 

    def pop
        if @top.nil?
            puts "Empty Stack"
        else
            while true 
                top_tmp = @top 
                if (compare_and_swap(top_tmp, top_tmp.not_nil!.next))
                    return top_tmp.not_nil!.value 
                end 
            end 
        end 
    end 


    def to_s(io) 
        list = [] of Int32 | Nil 
        node = @top 
        while node 
            list << node.value 
            node = node.next 
        end
        io << "#{list}"
    end 
end 

s = Stack(Int32).new 
s.push 42
s.push 22
s.push 66 
puts s.to_s
s.pop 
puts s.to_s
#s.pop 
#s.pop 
#puts s.to_s 

