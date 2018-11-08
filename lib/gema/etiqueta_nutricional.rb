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
		@IR=[8400,2000,70,20,260,50,90,6]
	end
	def v_energeticokJ
		(37.0*@grasa)+(17.0*@hidratos)+(17.0*@proteinas)+(25*@sal)
	end
	def v_energeticokc
		(9.0*@grasa)+(4.0*@hidratos)+(4.0*@proteinas)+(6*@sal)
	end
	def porcion_kJ
		v_energeticokJ*@porcion
	end
	def porcion_kc
		v_energeticokc*@porcion
	end
end
