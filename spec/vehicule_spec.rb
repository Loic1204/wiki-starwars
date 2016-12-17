require_relative 'spec-helper'
require 'persos'

module Persos
  describe Vehicule do
    describe "#complete?" do
      it "cree un vehicule complet si tous les champs sont specifies" do
        c = Vehicule.new( "Motojet 74-Z", "Motojet", 
          [Arme.new( "canon laser leger", 1, "50 yards" )] )
        assert c.complete?
      end

      it "cree un vehicule incomplet si la classe n'est pas specifiee" do
        c = Vehicule.new( "Motojet 74-Z", nil, 
          [Arme.new( "canon laser leger", 1, "50 yards" )] )
        refute c.complete?
      end

      it "cree un vehicule complet si aucune arme n'est specifiee" do
        c = Vehicule.new( "Motojet 74-Z", "Motojet", nil )
        assert c.complete?
      end
    end

    describe "#to_s" do
      it "signale une exception lorsque non complet" do
        lambda do
          Vehicule.new( "", nil, [] ).to_s
        end.must_raise DBC::Failure
      end

      it "retourne tous les elements du vehicule lorsque complet" do
        arme1 = Arme.new( "canon laser leger", 2, "50 yards" )
        arme2 = Arme.new( "canon laser lourd", 1, "70 yards" )

        c = Vehicule.new( "Motojet 74-Z", "Motojet", [arme1, arme2] )

        attendu = <<-EOS
        <vehicule>
          <nom>Motojet 74-Z</nom>
          <classe>Motojet</classe>
        <arme>
          <nom>canon laser leger</nom>
          <quantite>2</quantite>
          <portee>50 yards</portee>
        </arme>

        <arme>
          <nom>canon laser lourd</nom>
          <quantite>1</quantite>
          <portee>70 yards</portee>
        </arme>

        </vehicule>
        EOS
        c.to_s.must_equal attendu
      end
    end
  end
end
