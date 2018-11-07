RSpec.describe Gema do
  it "has a version number" do
    expect(Gema::VERSION).not_to be nil
  end

	describe Etiqueta do
	   	p = Etiqueta.new("galleta",20,2,30,50,25,40)
		context "Caracteristicas de alimentos" do 
			it "Debe existir un nombre para la etiqueta" do
		  		 expect("galleta").to eq(p.nombre)
			end
			it "Debe existir la cantidad de grasa" do 
				expect(20).to eq(p.grasa)
			end
			it "Debe existir la cantidad de hidratos de carbono" do
				expect(30).to eq(p.hidratos)
			end
			it "Debe existir la cantidad de grasas saturadas" do
				expect(2).to eq(p.saturadas)
			end
			it "Debe existir la cantidad de proteinas" do
				expect(50).to eq(p.proteinas)
			end
			it "Debe existir la cantidad de azucares" do
				expect(25).to eq(p.azucares)
			end
			it "Debe existir la cantidad de sal" do
				expect(40).to eq(p.sal)
			end
		end
	end
end
