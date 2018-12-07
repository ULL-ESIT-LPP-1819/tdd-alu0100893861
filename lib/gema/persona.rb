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
	attr_reader 
	def initialize(persona,peso,talla)
		super(persona,peso,talla)
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
		super.to_s
	end
end

