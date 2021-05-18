module TreiberStack
    class Stack(T)
        def initialize
            @stack = Array(T).new
            @size = 0
        end 
        
        def initialize(initial_capacity)
            @stack = Array(T).new(initial_capacity: initial_capacity)
            @size = 0
        end 
        
        def size 
            @size 
        end 

        def push(value)
            @stack << value
            @size += 1
        end 

        def pop
            @stack.pop?
            @size -= 1
        end 
        
        def empty
            @stack.empty?
        end 

        def print_values
            print "["
            @stack.each do |element|   
                if element == @stack[-1] 
                    print " #{element}"
                else 
                    print " #{element},"
                end  
            end 
            print "]"
        end 
    end 

    s = Stack(Int32).new 
    s.push 42
    s.push 12 
    s.push 22
    s.push 44
    s.print_values 
    puts s.size 
    puts ""
    


    #s.pop 
    #puts ""
    #s.print_values
    #s.pop 
    #s.pop 
    #puts ""
    #s.print_values
    #s.pop 
    #puts ""
    #puts s.empty
end
