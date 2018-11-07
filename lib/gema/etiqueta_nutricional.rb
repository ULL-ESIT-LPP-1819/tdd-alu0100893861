class Etiqueta
	attr_reader :nombre, :grasa,:saturadas, :hidratos, :proteinas
	def initialize(nombre,grasa,saturadas, hidratos, proteinas)
		@nombre=nombre
		@grasa=grasa
		@saturadas=saturadas
		@hidratos=hidratos
		@proteinas=proteinas
	end
end
