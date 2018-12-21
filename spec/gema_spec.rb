RSpec.describe Gema do
  it "has a version number" do
    expect(Gema::VERSION).not_to be nil
  end

	describe Etiqueta do
		p = Etiqueta.new("galleta",10.5,5.10,77,7.6,24,0.83,6.1,2.2,2.9,2.1,12,12,0.3)
		context "Caracteristicas de alimentos" do 
			it "Debe existir un nombre para la etiqueta" do
		  		 expect("galleta").to eq(p.nombre)
			end
			it "Debe existir la cantidad de grasa" do 
				expect(10.5).to eq(p.grasa)
			end
			it "Debe existir la cantidad de hidratos de carbono" do
				expect(77).to eq(p.hidratos)
			end
			it "Debe existir la cantidad de grasas saturadas" do
				expect(5.10).to eq(p.saturadas)
			end
			it "Debe existir la cantidad de proteinas" do
				expect(7.6).to eq(p.proteinas)
			end
			it "Debe existir la cantidad de azucares" do
				expect(24).to eq(p.azucares)
			end
			it "Debe existir la cantidad de sal" do
				expect(0.83).to eq(p.sal)
			end
			it "Existe la cantidad de porciones" do
				expect(0.061).to eq(p.porcion)
			end
		end
		context "Existencia de Métodos" do
			it "Debe existir un metodo para calcular el valor nutricional" do
				expect(1847.45).to eq(p.valor_energetico[0])
				expect(437.88).to eq(p.valor_energetico[1])
			end
			it "Debe existir un metodo para calcular el valor por porciones" do
				expect(112.69).to eq(p.valor_porcion[0].round(2))
				expect(26.71).to eq(p.valor_porcion[1].round(2))
			end
			it "Existe un metodo para obtener la etiqueta formateada" do 
				p.to_s
			end	
		end
		context "Añadiendo valores de sustancias opcionales"do
			it "Añadiendo las grasas monoinsaturadas"do 
				expect(2.2).to eq(p.monoinsaturadas)
			end
			it "Añadiendo las grasas poliinsaturadas"do
                                expect(2.9).to eq(p.poliinsaturadas)
                        end
			it "Añadiendo la fibra alimentaria"do
				expect(2.1).to eq(p.fibra_alimentaria)
                        end
			it "Añadiendo los azucares polialcoholes"do
                                expect(12).to eq(p.polialcoholes)
                        end
			it "Añadiendo loss azucares almidon"do
                                expect(12).to eq(p.almidon)
                        end
			it "Añadiendo las vitaminas y minerales "do
				expect(0.3).to eq(p.vit_min)
                        end
		end
	context "Comparar la clase Valor Energético" do
    		before :all do
      		@galletas =  Etiqueta.new("galleta",10.5,5.10,77,7.6,24,0.83,6.1,2.2,2.9,2.1,12,12,0.3)
		@pan = Etiqueta.new("pan",31.6,11.0,57.6,56.8,6.0,0.11,25.0,8,9,10,12,13,0.4)
		@arroz = Etiqueta.new("arroz",31.6,11.0,57.6,56.8,6.0,0.11,25.0,8,9,10,16,3,0.2)
    		end
 		 it " pan > galletas " do
    			expect(@pan > @galletas).to eq(true)
  		end
  		it " galletas < pan" do
    			expect(@galletas < @pan).to eq(true)
  		end
  		it " pan  == pan " do
    			expect(@pan == @pan).to eq(true)
  		end
  		it " galletas <= pan " do
    			expect(@galletas <= @pan).to eq(true)
  		end
  		it "arroz >= pan" do
    			expect(@arroz >= @pan).to eq(true)
 		end
 	 end
end
	describe Lista do 
		valor=0
		before :all do
			@p=Lista.new
			node=Node.new(1,nil,nil)
		end
		context "Pruebas de la clase Lista" do
			it "existe la clase lista" do
				l=Lista.new
			end
			it "Se almacenan el head y el tail" do
				expect(@p.head).to eq(nil)
				expect(@p.tail).to eq(nil)
			end
			it "existe el metodo empty" do
				expect(@p.empty?).to eq(true)
			end
			it "existe el metodo insertar" do
				@p.insert(1)
				expect(@p.head.value).to eq(1)
				expect(@p.tail.value).to eq(1)
			end
			it "existe un metodo para extraer por la cola y por la cabeza" do
				@p.insert(1)
				expect(@p.get_head.value).to eq(1)
				expect(@p.get_tail.value).to eq(1)
				expect(@p.get_head.value).to eq(1)
				expect(@p.get_tail.value).to eq(1)
			end
		end
		context "pruebas del struct" do
			it "existen el nodo" do
				n= Node.new
			end
		end
	
		context "pruebas de clasificacion de sal" do
			before :each do
      				@lista = Lista.new()
				@etiqueta1 = Etiqueta.new("galletas",1,1,1,1,2,1,1,1,1,1,1,1,1)
				@etiqueta2 = Etiqueta.new("arroz",1,1,1,2,2,1,1,1,1,1,1,1,1)
				@etiqueta3 = Etiqueta.new("pan",1,1,1,3,2,1,1,1,1,1,1,1,1)
				@etiqueta4 = Etiqueta.new("chocolate",1,1,1,4,2,1,1,1,1,1,1,1,1)
				@etiqueta5 = Etiqueta.new("carne",1,1,1,5,2,1,1,1,1,1,1,1,1)
				@lista.insert(@etiqueta1)
				@lista.insert(@etiqueta2)
				@lista.insert(@etiqueta3)
			end
			it "metodo que devuelva si la sal es mayor o menor que 6" do
				aux=@lista.head
				expect(@etiqueta2.gt_6?).to eq(false)
				

			end	
			it "Clasificar la sal"do
				aux=@lista.head
				j=0
				mayor_6=[]
				menor_6=[]
				while(aux!=nil)
					if(aux.value.gt_6?)
						mayor_6[j]=aux.value.nombre
					
						aux=aux.next
						
					else
						menor_6[j]=aux.value.nombre
					
						aux=aux.next
						
					end
					j=j+1
				end
				puts "MAYORES DE 6"
				for i in (0...5)
				puts mayor_6[i]
				end
				 puts "MENORES DE 6"
                                for i in (0...5)
                                puts menor_6[i]
                                end
			end	
		it "Comprobando el metodo del collect" do
				expect(@lista.collect{|i| i.to_s}).to eq(["1","2","3"])
     		end
     		it "Comprobando el metodo select" do
			expect(@lista.select{|i| i.nombre.size < 4}).to eq([@etiqueta3])
     		end
     		it "comprobando el metodo max " do
				expect(@lista.max).to eq(@etiqueta3)
     		end
     		it "Comprobando el metodo min" do
			expect(@lista.min).to eq(@etiqueta1)
     		end
     		it "Comprobando el metodo sort" do
			expect(@lista.sort{ |a,b| b<=>a}).to eq([@etiqueta3,@etiqueta2,@etiqueta1])
     		end
	end	
end
	describe Individuo do
		 before :all do
                                @lista = Lista.new
				@humano1 = Paciente.new("jaime",40,1.6,1,23)
                                @humano2 = Paciente.new("carlos",80,1.5,1,23)
				@humano3 = Paciente.new("maria",70,1.9,2,24)
				@humano4 = Paciente.new("alberto",57,1.8,1,25)
				@humano5 = Paciente.new("juan",140,1.7,1,25)
				@lista.insert(@humano1)
                                @lista.insert(@humano2)
                                @lista.insert(@humano3)
                                @lista.insert(@humano4)
                                @lista.insert(@humano5)
		end
		context "Pruebas de la clase persona" do
			it "comprobando la clase de un objeto" do
				@a = Individuo.new("jaime",57,1.7)
				expect(@a.class.to_s).to eq("Individuo")
				expect(@humano1.is_a? Paciente).to eq(true)
			end
			it "comprobando el tipo del objeto " do
				expect(@humano1).to respond_to(:persona)
				expect(@humano2).to respond_to(:talla)
		 		expect(@humano3).to respond_to(:imc)		
			end
			it "Un punto es un punto"do 
				expect(@humano1).to be_a_kind_of(Object)
			end
			it "comprobando jerarquía" do
				expect(Paciente.superclass.to_s).to eq("Individuo")
				expect(@humano1.is_a? Object).to eq(true)
				expect(@humano1.is_a? BasicObject).to eq(true)
				expect(@humano1.is_a? Individuo).to eq(true)
				expect(@humano1.is_a? Paciente).to eq(true)
			end
		end
		context "Pruebas para clasificar los 5 individuos" do
			it "clasificacion segun imc"do
				aux= @lista.head
				while(aux!=nil)
					if(aux.value.tabla_imc.to_s=="Delgado")
						expect(aux.value.tabla_imc.to_s).to eq("Delgado")
						puts "El paciente #{aux.value.persona.to_s} está DELGADO"
						aux=aux.next
					elsif(aux.value.tabla_imc.to_s=="Adecuado/Aceptable")
						expect(aux.value.tabla_imc.to_s).to eq("Adecuado/Aceptable")
						puts "El paciente #{aux.value.persona.to_s} está DELGADO"
						aux=aux.next
					elsif(aux.value.tabla_imc.to_s=="Sobrepeso")
					       expect(aux.value.tabla_imc.to_s).to eq("Sobrepeso")
					       puts "El paciente #{aux.value.persona.to_s} tiene Sobrepeso"
				       		aux=aux.next
				 	elsif(aux.value.tabla_imc.to_s=="Obesidad grado 1")
						expect(aux.value.tabla_imc.to_s).to eq("Obesidad grado 1")
						puts "El paciente #{aux.value.persona.to_s} tiene Obesidad grado 1"
						aux=aux.next
					elsif(aux.value.tabla_imc.to_s=="Obesidad grado 2")
						expect(aux.value.tabla_imc.to_s).to eq("Obesidad grado 2")
						puts "El paciente #{aux.value.persona.to_s} tiene Obesidad grado 2"
						aux=aux.next
					elsif(aux.value.tabla_imc.to_s=="Obesidad grado 3")
						expect(aux.value.tabla_imc.to_s).to eq("Obesidad grado 3")
						puts "El paciente #{aux.value.persona.to_s} tiene Obesidad grado 3"
						aux=aux.next
					end
				end
			end
		end
	context "Haciendo la clase Individuo Comparable" do
   		before :each do
			@lista2 = Lista.new()
     			@persona1 = Individuo.new("Jaime",10,10)
      			@persona2 = Individuo.new("Antonio",60,80)
     			@persona3 = Individuo.new("Mar",30,50)
			@lista2.insert(@persona1)
			@lista2.insert(@persona2)
			@lista2.insert(@persona3)
   		end
		it " Jame < Antonio" do
      			expect(@persona1<@persona2).to eq(true)
    		end
    		it " Mar > Jame" do
			expect(@persona3 > @persona1).to eq(true)
    		end
    		it "Antonio  == Antonio" do
      			expect(@persona2 == @persona2).to eq(true)
    		end
    		it "Jame <= Mar" do
      			expect(@persona1 <= @persona3).to eq(true)
		end
   		it "Antonio >= Mar" do
      			expect(@persona2 >= @persona3).to eq(true)
   		end
		it "Probando el metodo collect"do
			expect(@lista2.collect{ |i| i.to_s}).to eq(["Jaime 10 10","Antonio 60 80","Mar 30 50"])
		end
		it "Probando el metodo select"do 
			expect(@lista2.select{|i| i.persona.size > 4}).to eq([@persona1,@persona2])
  		end
		it "probando el min"do
			expect(@lista2.min).to eq(@persona1)
		end
		it "probando el max"do
			expect(@lista2.max).to eq(@persona2)
		end
		it "probando el sort"do
			expect(@lista2.sort).to eq([@persona1,@persona3,@persona2])
		end
	end
	end
	describe Paciente do
		 before :each do
                           @paciente1 =  Paciente.new("Juan",70,185,1,25)
			   @paciente2 = Paciente.new("Maria",60,160,2,23)
			   @paciente3 =  Paciente.new("Jaime",70,185,1,25)
			   @paciente4 =  Paciente.new("Javi",70,185,1,25)
			   @paciente5 =  Paciente.new("alberto",90,185,1,25)
			   @paciente6 =  Paciente.new("ari",80,185,2,25)
			   @paciente7 =  Paciente.new("susana",70,185,2,25)
			   @paciente8 =  Paciente.new("cris",40,185,2,25)
			   @paciente9 =  Paciente.new("joan",30,185,1,25)
			   @paciente10 =  Paciente.new("pedro",70,185,1,25)
			   @etiqueta1 = Etiqueta.new("galletas",1,1,1,1,2,1,1,1,1,1,1,1,1)
                           @etiqueta2 = Etiqueta.new("arroz",1,1,1,2,2,1,1,1,1,1,1,1,1)
                           @etiqueta3 = Etiqueta.new("pan",1,1,1,3,2,1,1,1,1,1,1,1,1)
                           @etiqueta4 = Etiqueta.new("chocolate",1,1,1,4,2,1,1,1,1,1,1,1,1)
                           @etiqueta5 = Etiqueta.new("carne",1,1,1,5,2,1,1,1,1,1,1,1,1)
                        @menu1 = [@etiqueta1,@etiqueta2,@etiqueta3]
                        @menu2 = [@etiqueta1,@etiqueta2,@etiqueta4]
                        @menu3 = [@etiqueta1,@etiqueta2,@etiqueta5]
                        @menu4 = [@etiqueta2,@etiqueta3,@etiqueta4]
                        @menu5 = [@etiqueta1,@etiqueta3,@etiqueta5]
			@menu6 = [@etiqueta1,@etiqueta3,@etiqueta4]
			@menu7 = [@etiqueta2, @etiqueta3,@etiqueta5]
	     		@menu8 = [@etiqueta2, @etiqueta4, @etiqueta5]
			@menu9 = [@etiqueta1, @etiqueta4, @etiqueta5]
			@menu10= [@etiqueta3, @etiqueta4, @etiqueta5]
			@array_menu = [@menu1, @menu2, @menu3, @menu4, @menu5, @menu6, @menu7, @menu8, @menu9, @menu10]
			@list = Lista.new
			@list.insert(@paciente1)
			@list.insert(@paciente2)
			@list.insert(@paciente3)
			@list.insert(@paciente4)
			@list.insert(@paciente5)
			@list.insert(@paciente6)
			@list.insert(@paciente7)
			@list.insert(@paciente8)
			@list.insert(@paciente9)
			@list.insert(@paciente10)
                        
		end
		context "Comprobando metodos" do
			it "Existe el metodo del calculo del peso ideal"do
				expect(@paciente1.teorico).to eq(76.25)
			end
			it "Existe el metodo del calculo gastrico energetico basal"do
				expect(@paciente1.gasto_basal).to eq(1736.25)
			end
			it "Existe el metodo para calcular el efecto termogeno"do
				expect(@paciente1.efecto).to eq(173.63)
			end
			it "Existe el metodo para calcular el factor de actividad fisica"do
				expect(@paciente1.actividad_fisica("Reposo")).to eq(0.0)
			end
			it "Existe el metodo para calcular el gasto de actividad fisica"do
				expect(@paciente1.gasto_act_fisica("Ligera")).to eq(208.35)
			end
			it "Existe el metodo para calcular el gasto de energia total "do
				expect(@paciente1.gasto_total("Moderada")).to eq(1910.15)
			end
		end
		context "Realizando pruebas del menu"do
				it "Prueba para el menu 1" do 
					expect(@menu1.collect{|i| i.v_energeticokJ}.reduce(:+)).to be < @paciente1.gasto_total("Ligera")
    				end
				it "Prueba menu 2"do
					expect(@menu2.collect{|x| x.v_energeticokJ}.inject{|sum,n| sum + n}).to be < @paciente1.gasto_total("Moderada")
				end
				it "Prueba menu 3" do
					expect(@menu3.collect{|x| x.v_energeticokJ}.reduce(:+)).to be < @paciente1.gasto_total("Intensa")
				end
				it "Prueba menu 4" do
					expect(@array_menu[1].collect{|x| x.v_energeticokJ}.inject{|sum,n| sum + n}).to be < @paciente1.gasto_total("Moderada")
				end

		end
		context "Pruebas del menu" do
			it "Pruebas del bucle for para valoraciones nutricionales" do
				Benchmark.bm do |x|

					x.report{	
				array = Array.new
				array = [@menu1] 
				#@x = [@menu1,@menu2,@menu3,@menu4]
				for i in 0..(@array_menu.length-1) do 
					currentMin = i	
					for j in (i+1)..(@array_menu.length-1) do 
						if @array_menu[j].collect{|y| y.v_energeticokJ}.reduce(:+)  < @array_menu[currentMin].collect{|y| y.v_energeticokJ}.reduce(:+) 
							currentMin = j
						end
					end
						@tmp = @array_menu[currentMin]
						array.insert(currentMin,@array_menu[i])
						array.insert(i, @tmp)
				end
					}end
						
				end
			#puts array
		
				it "Pruebas de la lista con el bucle for" do
				
					Benchmark.bm do |x|

						x.report{
					@arr = Array.new
					@arr = [@paciente1]

					for i in 0..9 do
                                        	@nodo = @list.get_head.value
						@valor = @nodo.gasto_total("Ligera")
						currentMin = i
                                        for j in (i+1)..(@arr.length-1) do
						if @valor < @arr[j].gasto_total("Ligera")
							@arr.insert(j,@nodo)
							currentMin = j
						break
                                                end
                                        end
					if j ==(@arr.length-1)
                                                @arr.insert(j,@nodo)
                                        end
					

                                	end
					}end
				end
				it "pruebas de lista para ordenar con Each" do 
					Benchmark.bm do |x|

						x.report{
					@arr = Array.new
					@arr = [@paciente1]
             				 @gasto = 0.0
              				(0..9).each do |i|
                				@nodo = @list.get_head.value
                				@gasto = @nodo.gasto_total("Ligera")
					(0..(@arr.length-1)).each do |j|
						if @gasto < @arr[j].gasto_total("Ligera")
                    					@arr.insert(j,@nodo)
                    					break
                  				end
                  			if j ==(@arr.length-1)
						@arr.insert(j,@nodo)
                  			end
                			end
             				end
						}end
                                end
		
			it "Pruebas del each con valores nutricionales" do
				Benchmark.bm do |x|
					x.report{
				@arr = Array.new
                                @arr = [@menu1]
				(0..(@array_menu.length-1)).each do |i|
                                        currentMin = i
					((i+1)..(@array_menu.length-1)).each do |j|
                                                if @array_menu[j].collect{|y| y.v_energeticokJ}.reduce(:+)  < @array_menu[currentMin].collect{|y| y.v_energeticokJ}.reduce(:+)
                                                        currentMin = j
                                                end
                                        end
                                                @tmp = @array_menu[currentMin]
                                                @arr.insert(currentMin,@array_menu[i])
                                                @arr.insert(i, @tmp)
                                end
					}end

			end
			it "Pruebas del sort para valores nutricionales" do
				Benchmark.bm do |x|
					x.report{	
			       	@arr = @array_menu.sort!{ |x,y| x.collect{|i| i.v_energeticokJ}.reduce(:+) <=> y.collect{|i| i.v_energeticokJ}.reduce(:+)}
				}end
			end
			it "Prueba del sort para gsto energetico" do
				Benchmark.bm do |x|
					x.report{	
			       	@arr = @list.sort{|x,y| x.gasto_total("Ligera") <=> y.gasto_total("Ligera")}
					}end
			end
		end
		end
	end
