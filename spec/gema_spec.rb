RSpec.describe Gema do
  it "has a version number" do
    expect(Gema::VERSION).not_to be nil
  end

	describe Etiqueta do
	   	p = Etiqueta.new("galleta",20)
		context "Caracteristicas de alimentos" do 
			it "Debe existir un nombre para la etiqueta" do
		  		 expect("galleta").to eq(p.nombre)
			end
			it "Debe existir la cantidad de grasa" do 
				expect(20).to eq(p.grasa)
			end
		end
	end
end
