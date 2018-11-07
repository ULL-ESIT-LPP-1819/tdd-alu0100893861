class Etiqueta
	attr_reader :nombre, :grasa,:saturadas, :hidratos, :proteinas, :azucares, :sal
	def initialize(nombre,grasa,saturadas, hidratos, proteinas,azucares, sal)
		@nombre=nombre
		@grasa=grasa
		@saturadas=saturadas
		@hidratos=hidratos
		@proteinas=proteinas
		@azucares=azucares
		@sal=sal
	end
end
