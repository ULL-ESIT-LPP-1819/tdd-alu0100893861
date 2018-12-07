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
				@etiqueta2 = Etiqueta.new("arroz",1,1,1,1,2,1,1,1,1,1,1,1,1)
				@etiqueta3 = Etiqueta.new("pan",1,1,1,1,2,1,1,1,1,1,1,1,1)
				@etiqueta4 = Etiqueta.new("chocolate",1,1,1,1,2,1,1,1,1,1,1,1,1)
				@etiqueta5 = Etiqueta.new("carne",1,1,1,1,2,1,1,1,1,1,1,1,1)
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
			@lista.insert(@etiqueta1)
                                @lista.insert(@etiqueta2)
                                @lista.insert(@etiqueta3)
				expect(@lista.collect{|i| i.to_s}).to eq(["galletas","arroz","pan"])
     		end
     		it "Comprobando el metodo select" do
      			@lista.insert(@etiqueta1)
                                @lista.insert(@etiqueta2)
                                @lista.insert(@etiqueta3)
			expect(@lista.select{|i| i.nombre.size < 5}).to eq([@etiqueta3])
     		end
     		it "comprobando el metodo max " do
       			@lista.insert(@etiqueta1)
                                @lista.insert(@etiqueta2)
                                @lista.insert(@etiqueta3)
				expect(@lista.max).to eq(@etiqueta1)
     		end
     		it "Comprobando el metodo min" do
       			@lista.insert(@etiqueta1)
                                @lista.insert(@etiqueta2)
                                @lista.insert(@etiqueta3)
			expect(@lista.min).to eq(@etiqueta2)
     		end
     		it "Comprobando el metodo sort" do
       			@lista.insert(@etiqueta1)
                                @lista.insert(@etiqueta2)
                                @lista.insert(@etiqueta3)
			expect(@lista.sort{ |a,b| b<=>a}).to eq([@etiqueta1,@etiqueta3,@etiqueta2])
     		end
	end	
end
	describe Individuo do
		 before :all do
                                @lista = Lista.new
				@humano1 = Paciente.new("jaime",40,1.6)
                                @humano2 = Paciente.new("carlos",80,1.5)
				@humano3 = Paciente.new("maria",70,1.9)
				@humano4 = Paciente.new("alberto",57,1.8)
				@humano5 = Paciente.new("juan",140,1.7)
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
   		before :all do
     			@persona1 = Individuo.new("Jame",10,10)
      			@persona2 = Individuo.new("Antonio",60,80)
     			@persona3 = Individuo.new("Ma",30,50)
   		end
		it " Jame < Antonio" do
      			expect(@persona1>@persona2).to eq(true)
    		end
    		it " Maria > Jame" do
			expect(@persona3 > @persona1).to eq(true)
    		end
    		it "Antonio  == Antonio" do
      			expect(@persona2 == @persona2).to eq(true)
    		end
    		it "Jame <= Maria" do
      			expect(@persona1 <= @persona3).to eq(true)
		end
   		it "Antonio >= Maria" do
      			expect(@persona2 >= @persona3).to eq(false)
   		end
  		end
	end
end
