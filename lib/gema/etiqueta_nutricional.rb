class Etiqueta
	attr_reader :nombre, :grasa,:saturadas, :hidratos, :proteinas, :azucares, :sal, :valor_energetico
	def initialize(nombre,grasa,saturadas, hidratos, proteinas,azucares, sal)
		@nombre=nombre
		@grasa=grasa
		@saturadas=saturadas
		@hidratos=hidratos
		@proteinas=proteinas
		@azucares=azucares
		@sal=sal
		@valor_energetico=[v_energeticokJ,v_energeticokc]
	end
	def v_energeticokJ
		(37*(grasa+saturadas))+(17*(hidratos+azucares))+(17*proteinas)
	end
	def v_energeticokc
		(9*(grasa+saturadas))+(9*(hidratos+azucares))+(17*proteinas)
	end
end
