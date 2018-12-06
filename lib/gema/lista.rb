#create a struct with :value, :next and :prev
Node = Struct.new(:value, :next, :prev)
class Lista
	include Enumerable
        attr_reader :head, :tail
        def initialize
                @head=nil
                @tail=nil
        end
        def empty?
                @head==nil
                @head==nil
        end
        def insert(value)
                nodo = Node.new(value,nil,nil)
                if empty?
                        @head=nodo
                        @tail=nodo
                else
                        @tail.next=nodo
                        nodo.prev=@tail
                        @tail = nodo 
                end 
        end
	def get_head
       	 	aux = @head
        	@head = @head.next
        	aux
    	end

    	def get_tail
        	aux = @tail
       		@tail = @tail.prev
      	 	aux
   	 end
	def sort
    	
	end
	def each 
       		it = @head
       		while it !=nil 
            		yield it.value
            	it=it.next
       		end
    	end	
end 

