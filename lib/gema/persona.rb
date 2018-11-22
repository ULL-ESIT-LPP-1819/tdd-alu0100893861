class Individuo
	attr_reader :persona
	def initialize(persona)
		@persona=persona
	end
	def to_s
		"#{@persona}"
	end
end
class Paciente < Individuo 
	attr_reader :peso, :talla, :cintura, :cadera
	def initialize(persona, peso, talla, cintura, cadera)
		super(persona)
		@peso=peso
		@talla=talla
		@cintura=cintura
		@cadera=cadera
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
		"#{@persona} #{@peso} #{@talla} #{@cintura} #{@cadera}"
	end
end

