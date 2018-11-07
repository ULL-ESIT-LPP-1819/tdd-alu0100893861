class Etiqueta
	attr_reader :nombre, :grasa,:saturadas, :hidratos
	def initialize(nombre,grasa,saturadas, hidratos)
		@nombre=nombre
		@grasa=grasa
		@saturadas=saturadas
		@hidratos=hidratos
	end
end
