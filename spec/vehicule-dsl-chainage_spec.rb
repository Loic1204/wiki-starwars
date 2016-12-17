require_relative 'spec-helper'
require 'persos'

module Persos
  describe Vehicule do
    describe "#complete?" do
      it "cree un vehicule complet si tous les champs sont specifies" do
	v = Vehicule.nom( "Motojet 74-Z" )
                    .classe( "Motojet")
                    .arme_vehicule(Arme.nom( "canon laser léger" )
                                       .quantite(1)
                                       .portee( "50 yards" )
                                       .fin)
                                  .fin
        assert v.complete?
      end

      it "cree un vehicule incomplet si la classe n'est pas specifiee" do
        v = Vehicule.nom( "Motojet 74-Z" )
                    .arme_vehicule(Arme.nom( "canon laser léger" )
                                       .quantite(1)
                                       .portee( "50 yards" )
                                       .fin)
                                  .fin
        refute v.complete?
      end

      it "cree un vehicule complet si aucune arme n'est specifiee" do
        v = Vehicule.nom( "Motojet 74-Z" )
                    .classe( "Motojet")
                    .fin
        assert v.complete?
      end

    #TODO describe "#to_s" do
    end
  end
end
