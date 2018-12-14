class Individuo
	include Comparable
	attr_reader :persona, :peso, :talla
	def initialize(persona,peso,talla)
		@persona=persona
		@peso=peso
		@talla=talla
	end
	def to_s
		"#{@persona} #{@peso} #{@talla}"
	end
	def <=>(other)
       		return nil unless other.instance_of?Individuo
       		@peso <=> other.peso
    	end
end
class Paciente < Individuo 
	attr_reader :sexo, :edad
	def initialize(persona,peso,talla,sexo,edad)
		super(persona,peso,talla)
		@sexo=sexo
		@edad=edad
	end
	def imc
		@peso / (@talla * @talla)
	end

	def tabla_imc
		if(imc<18.5)
			"Delgado"
		elsif(imc>18.5 && imc < 25.0)
			"Adecuado/Aceptable"
		elsif(imc > 24.9 && imc < 30)
			"Sobrepeso"
		elsif(imc > 29.9 && imc < 35.0)
			"Obesidad grado 1"
		elsif(imc > 34.9 && imc < 40.0)
			"Obesidad grado 2"
		elsif(imc > 40.0)
			"Obesidad grado 3"
		end
	end
	def to_s
		super.to_s "#{@edad}, #{@sexo}"
	end
	def teorico
		(talla-150)*0.75+50
	end
	def gasto_basal
		return ((10*@peso)+(6.25*@talla)-(5*@edad)+5).round(2) if @sexo == 1
        	((10*@peso)+(6.25*@talla)-(5*@edad) - 161).round(2)
	end
	def efecto
		 (gasto_basal * 0.10).round(2)
	end
	def actividad_fisica(actividad)
       		 return 0.0 if actividad == "Reposo"
      		 return 0.12 if actividad == "Ligera"
      		 return 0.27 if actividad == "Moderada"
      		 return 0.54 if actividad == "Intensa"
    	end
	def gasto_act_fisica(actividad)

       		(actividad_fisica(actividad) * gasto_basal).round(2)

    	end

    def gasto_total(actividad)

        (gasto_basal + efecto + actividad_fisica(actividad)).round(2)

    end
end

