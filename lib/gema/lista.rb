#create a struct with :value, :next and :prev
Node = Struct.new(:value, :next, :prev)
class Lista
	attr_reader :head, :tail
	def initialize
		@head=nil
		@tail=nil
	end
	def empty?
		@head==nil
		@head==nil
	end
end
