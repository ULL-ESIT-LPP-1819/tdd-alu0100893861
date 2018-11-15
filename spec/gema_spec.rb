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
		before :each do
			@p=Lista.new
		end
		context "Pruebas de la clase Lista" do
			it "existe la clase lista" do
				l=Lista.new
			end
			it "Se almacenan el head y el tail" do
				expect(@p.head).to eq(nil)
				expect(@p.tail).to eq(nil)
			end

		end
	end
end
