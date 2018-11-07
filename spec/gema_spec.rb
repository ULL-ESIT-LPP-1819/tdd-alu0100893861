RSpec.describe Gema do
  it "has a version number" do
    expect(Gema::VERSION).not_to be nil
  end

	describe Etiqueta do
	   	p = Etiqueta.new("galleta",70,20,260,50,90,6)
		context "Caracteristicas de alimentos" do 
			it "Debe existir un nombre para la etiqueta" do
		  		 expect("galleta").to eq(p.nombre)
			end
			it "Debe existir la cantidad de grasa" do 
				expect(70).to eq(p.grasa)
			end
			it "Debe existir la cantidad de hidratos de carbono" do
				expect(20).to eq(p.hidratos)
			end
			it "Debe existir la cantidad de grasas saturadas" do
				expect(260).to eq(p.saturadas)
			end
			it "Debe existir la cantidad de proteinas" do
				expect(50).to eq(p.proteinas)
			end
			it "Debe existir la cantidad de azucares" do
				expect(90).to eq(p.azucares)
			end
			it "Debe existir la cantidad de sal" do
				expect(6).to eq(p.sal)
			end
		context "Existencia de Métodos" do
			it "Debe existir un metodo para calcular el valor nutricional" do
				expect(2000).to eq(p.valor_energetico[0])
				expect(2000).to eq(p.valor_energetico[1])
			end	
		end
		end
	end
end
