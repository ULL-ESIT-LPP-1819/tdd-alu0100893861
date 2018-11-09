class Etiqueta
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
	def to_s
		puts "#{@nombre}		Por 100g de producto |   IR por 100g | Por porcion de #{@porcion*100}g  | IR por porcion de #{@porcion*100} producto" 
		puts "Valor energetico: #{@valor_energetico[0].round(2)}kJ/#{@valor_energetico[1].round(2)}kc |  #{(@valor_energetico[0]/@IR[0]).round(2)*100}%/#{(@valor_energetico[1]/@IR[0]).round(2)*100}%	| #{@valor_porcion[0].round(2)}kJ/#{@valor_porcion[1].round(2)}kc	|  #{((@valor_energetico[0]/@IR[0])*@porcion).round(2)*100}%/#{((@valor_energetico[1]/@IR[0])*@porcion).round(2)*100}%"
		puts "Grasa:			#{@grasa}	     |	#{(@grasa/@IR[2]).round(2)*100}%		|	#{(@grasa*@porcion).round(2)}	|	#{((@grasa*@porcion)*100/@IR[2]).round(2)}%" 
		puts "de las"
		puts "cuales saturadas:	#{@saturadas}          |  #{(@saturadas/@IR[3]).round(2)*100}%           |       #{(@saturadas*@porcion).round(2)}   |       #{((@saturadas*@porcion)*100/@IR[3]).round(2)}%"
		puts "monoinsaturadas:	#{@monoinsaturadas}          |  ------          |       #{(@monoinsaturadas*@porcion).round(2)}   |       ---------"
		puts "poliinsaturadas:	#{@poliinsaturadas}          |  -------         |       #{(@poliinsaturadas*@porcion).round(2)}   |       --------"
		puts"Hidratos de carbono 	#{@hidratos}           |  #{(@hidratos/@IR[4]).round(2)*100}%              |       #{(@hidratos*@porcion).round(2)}    |       #{((@hidratos*@porcion)*100/@IR[4]).round(2)}%"
		puts "los cuales Azucares:	#{@azucares}           |  #{(@azucares/@IR[6]).round(2)*100}%              |       #{(@azucares*@porcion).round(2)}   |       #{((@azucares*@porcion)*100/@IR[6]).round(2)}%"
		puts "Polialcoholes:		#{@polialcoholes}           |  ------          |       #{(@polialcoholes*@porcion).round(2)}   |       ------"
		puts "Almidón:		#{@almidon}           |  ------          |       #{(@almidon*@porcion).round(2)}   |       ----"	
		puts "Fibra alimentaria:	#{@fibra_alimentaria}          |  ----            |       #{(@fibra_alimentaria*@porcion).round(2)}   |       ----"
		puts "Proteínas: 		#{@proteinas}          |  #{(@proteinas/@IR[5]).round(2)*100}%           |       #{(@proteinas*@porcion).round(2)}   |       #{((@proteinas*@porcion)*100/@IR[5]).round(2)}%"
		puts "Sal:			#{@sal}         |  #{(@sal/@IR[7]).round(2)*100}% |       #{(@sal*@porcion).round(2)}   |       #{((@sal*@porcion)*100/@IR[7]).round(2)}%"
		puts "Vitaminas/minerales: 	#{@vit_min}          |  ---              |       #{(@sal*@porcion).round(2)}   |       ---"
	end
end

#p=Etiqueta.new("galleta",10.5,5.10,77.0,7.6,24.0,0.83,6.1)
#p.to_s
