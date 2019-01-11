class Menu
  attr_accessor :dia, :composicion, :titulo, :ingesta, :desayuno, :almuerzo, :cena, :v_energeticos

  def initialize(dia, &block)
    @dia = dia
    @titulo = "" 
    @ingesta = []
    @desayuno = []
    @almuerzo = []
    @cena = []
    @v_energeticos = []
    @v_totals = 0

    if block_given?  
      if block.arity == 1
        yield self
      else
       instance_eval(&block) 
      end
    end
  end

  def to_s
    output = @dia
    output << "\n#{'=' * @dia.size}\n\n"
    output << "Ingesta: #{@ingesta.join('   ')}\n\n"
    output << "\n Desayuno:"
    
    	@desayuno.each do |i|
		output << "\n #{i[:descripcion]}"
		output << "\n #{i[:porcion]}"
		output << "\n #{i[:gramos]}"
		output << "\n #{i[:grasas]}"
		output << "\n #{i[:carbohidratos]}"
		output << "\n #{i[:proteinas]}"
		output << "\n #{i[:fibra]}"
		output << "\n #{i[:sal]}"
		@v_energeticos = [i[:grasas]*36,i[:proteinas]*17,i[:carbohidratos]*17]
		output << "\n Valor energetico: #{@v_energeticos.inject{|i,sum| sum+i}}"
	end
	output << "\n Almuerzo:"

        @almuerzo.each do |i|
                output << "\n #{i[:descripcion]}"
                output << "\n #{i[:porcion]}"
                output << "\n #{i[:gramos]}"
                output << "\n #{i[:grasas]}"
                output << "\n #{i[:carbohidratos]}"
                output << "\n #{i[:proteinas]}"
                output << "\n #{i[:fibra]}"
                output << "\n #{i[:sal]}"
		@v_energeticos = [i[:grasas]*36,i[:proteinas]*17,i[:carbohidratos]*17]
                output << "\n Valor energetico: #{@v_energeticos.inject{|i,sum| sum+i}}"
        end
	output << "\n Cena:"

        @cena.each do |i|
                output << "\n #{i[:descripcion]}"
                output << "\n #{i[:porcion]}"
                output << "\n #{i[:gramos]}"
                output << "\n #{i[:grasas]}"
                output << "\n #{i[:carbohidratos]}"
                output << "\n #{i[:proteinas]}"
                output << "\n #{i[:fibra]}"
                output << "\n #{i[:sal]}"
		@v_energeticos = [i[:grasas]*36,i[:proteinas]*17,i[:carbohidratos]*17]
                output << "\n Valor energetico: #{@v_energeticos.inject{|i,sum| sum+i}}"
        end
   output
  end
 
  def ingesta(name,options={})
	  ingesta = name
	  ingesta << "Min: #{options[:min]}" if options[:min]
	  ingesta << "Max: #{options[:max]}" if options[:max]
	  @ingesta << ingesta
  end
  def desayuno(name,options = {})
	  desayuno = name
    desayuno << " (#{options[:descripcion]})" if options[:descripcion]
    desayuno << " (#{options[:porcion]})" if options[:porcion]
    desayuno << " (#{options[:gramos]})" if options[:gramos]
    desayuno << " (#{options[:grasas]})" if options[:grasas]
    desayuno << " (#{options[:carbohidratos]})" if options[:carbohidratos]
    desayuno << " (#{options[:proteinas]})" if options[:proteinas]
    desayuno << " (#{options[:fibra]})" if options[:fibra]
    desayuno << " (#{options[:sal]})" if options[:sal]
    @desayuno << desayuno
  end
 def almuerzo(name,options = {})
	 almuerzo = name
    almuerzo << " (#{options[:descripcion]})" if options[:descripcion]
    almuerzo << " (#{options[:porcion]})" if options[:porcion]
    almuerzo << " (#{options[:gramos]})" if options[:gramos]
    almuerzo << " (#{options[:grasas]})" if options[:grasas]
    almuerzo << " (#{options[:carbohidratos]})" if options[:carbohidratos]
    almuerzo << " (#{options[:proteinas]})" if options[:proteinas]
    almuerzo << " (#{options[:fibra]})" if options[:fibra]
    almuerzo << " (#{options[:sal]})" if options[:sal]
    @almuerzo << almuerzo
  end
  def cena(name,options = {})
	  cena = name
    cena << " (#{options[:descripcion]})" if options[:descripcion]
    cena << " (#{options[:porcion]})" if options[:porcion]
    cena << " (#{options[:gramos]})" if options[:gramos]
    cena << " (#{options[:grasas]})" if options[:grasas]
    cena << " (#{options[:carbohidratos]})" if options[:carbohidratos]
    cena << " (#{options[:proteinas]})" if options[:proteinas]
    cena << " (#{options[:fibra]})" if options[:fibra]
    cena << " (#{options[:sal]})" if options[:sal]
    @cena << cena
  end
end
