RSpec.describe Gema do
  it "has a version number" do
    expect(Gema::VERSION).not_to be nil
  end

	describe Etiqueta do
		p = Etiqueta.new("galleta",10.5,5.10,77,7.6,24,0.83)
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
				expect(6.1).to eq(p.porcion)
			end
		end
		context "Existencia de Métodos" do
			it "Debe existir un metodo para calcular el valor nutricional" do
				expect(1847.45).to eq(p.valor_energetico[0])
				expect(437.88).to eq(p.valor_energetico[1])
			end	
		end
	end
end
