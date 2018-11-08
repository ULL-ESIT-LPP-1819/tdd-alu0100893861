class Etiqueta
	attr_reader :nombre, :grasa,:saturadas, :hidratos, :proteinas, :azucares, :sal, :valor_energetico, :porcion,:valor_porcion
	def initialize(nombre,grasa,saturadas, hidratos, proteinas,azucares, sal,porcion)
		@nombre=nombre
		@grasa=grasa
		@saturadas=saturadas
		@hidratos=hidratos
		@proteinas=proteinas
		@azucares=azucares
		@sal=sal
		@fibra_alimentaria=2.1
		@valor_energetico=[v_energeticokJ,v_energeticokc]
		@porcion=porcion/100
		@valor_porcion=[porcion_kJ,porcion_kc]
	end
	def v_energeticokJ
		(37.0*@grasa)+(17.0*@hidratos)+(17.0*@proteinas)+(25*@sal)
	end
	def v_energeticokc
		(9.0*@grasa)+(4.0*@hidratos)+(4.0*@proteinas)+(6*@sal)
	end
	def porcion_kJ
		(37*(@porcion*@grasa))+(17*(@porcion*@hidratos))+(17*(@porcion+@proteinas))+(25*(@porcion+@sal))
	end
	def porcion_kc
		(9.0*(@porcion*@grasa))+(4.0*(@porcion*@hidratos))+(4.0*(@porcion+@proteinas))+(6*(@porcion+@sal))
	end
end
