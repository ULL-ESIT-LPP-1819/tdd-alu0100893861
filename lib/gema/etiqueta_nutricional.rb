class Etiqueta
	attr_reader :nombre, :grasa,:saturadas, :hidratos, :proteinas, :azucares
	def initialize(nombre,grasa,saturadas, hidratos, proteinas,azucares)
		@nombre=nombre
		@grasa=grasa
		@saturadas=saturadas
		@hidratos=hidratos
		@proteinas=proteinas
		@azucares=azucares
	end
end
