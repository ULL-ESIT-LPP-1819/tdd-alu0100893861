class Etiqueta
	include Comparable
	attr_reader :nombre, :grasa,:saturadas, :hidratos, :proteinas, :azucares, :sal, :valor_energetico, :porcion,:valor_porcion, :monoinsaturadas, :poliinsaturadas, :fibra_alimentaria, :polialcoholes, :almidon, :vit_min
	def initialize(nombre,grasa,saturadas, hidratos, proteinas,azucares, sal,porcion, monoinsaturadas,poliinsaturadas,fibra_alimentaria,polialcoholes,almidon,vit_min)
		@nombre=nombre
		@grasa=grasa
		@saturadas=saturadas
		@hidratos=hidratos
		@proteinas=proteinas
		@azucares=azucares
		@sal=sal
		@fibra_alimentaria=fibra_alimentaria
		@monoinsaturadas=monoinsaturadas
		@poliinsaturadas=poliinsaturadas
		@polialcoholes=polialcoholes
		@almidon=almidon
		@vit_min=vit_min
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
	def gt_6?
		if (@sal >= 6)
		     true
		else
	   		false
		end
	end
	def <=>(other)
		return nil unless other.instance_of?Etiqueta
       		@proteinas <=> other.proteinas
   	end
	def to_s
		"#{@proteinas}"
	end
end

