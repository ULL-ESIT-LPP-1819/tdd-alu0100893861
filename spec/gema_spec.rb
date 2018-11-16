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
			before :all do
      				@lista = Lista.new
				@etiqueta1 = Etiqueta.new("galletas",1,1,1,1,2,1,1,1,1,1,1,1,1)
				@etiqueta2 = Etiqueta.new("galles",1,1,1,1,8,8,1,1,1,1,1,1,1)
				@etiqueta3 = Etiqueta.new("gals",1,1,1,1,6,1,1,1,1,1,1,1,1)
				@etiqueta4 = Etiqueta.new("ga",1,1,1,1,7,1,1,1,1,1,1,1,1)
				@etiqueta5 = Etiqueta.new("gggg",1,1,1,1,3,1,1,1,1,1,1,1,1)
      				@lista.insert(@etiqueta1)
      				@lista.insert(@etiqueta2)
      				@lista.insert(@etiqueta3)
      				@lista.insert(@etiqueta4)
      				@lista.insert(@etiqueta5)
			end
			it "metodo que devuelva si la sal es mayor o menor que 6" do
				aux=@lista.head
				expect(@etiqueta2.gt_6?).to eq(true)
				

			end	
			it "Clasificar la sal"do
				aux=@lista.head
				j=0
				mayor_6=[]
				menor_6=[]
				while(aux!=nil)
					if(aux.value.gt_6?)
						mayor_6[j]=aux.value.nombre
						puts "mayores de 6:#{mayor_6[j]}"
						aux=aux.next
						
					else
						menor_6[j]=aux.value.nombre
						puts "menores de 6:#{menor_6[j]}"
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
		end
					
	end
end
