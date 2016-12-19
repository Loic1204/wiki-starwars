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
        lambda do
          v = Vehicule.nom( "Motojet 74-Z" )
                      .arme_vehicule(Arme.nom( "canon laser léger" )
                                         .quantite(1)
                                         .portee( "50 yards" )
                                         .fin)
                      .fin.must_raise DBC::Failure
        end
      end

      it "cree un vehicule complet si aucune arme n'est specifiee" do
        v = Vehicule.nom( "Motojet 74-Z" )
                    .classe( "Motojet")
                    .fin
        assert v.complete?
      end
    end

    describe "DSL avec chainage de methode" do

      before do
        arme = Arme.new( "canon laser leger", 1, "50 yards" )

        @attendu = Vehicule.new( "Motojet 74-Z", "Motojet", [arme] ).to_s
      end

      it "produit la meme chaine que l'objet construit explicitement" do
        v = Vehicule.nom( "Motojet 74-Z" )
                    .classe( "Motojet")
                    .arme_vehicule(Arme.nom( "canon laser leger" )
                                       .quantite(1)
                                       .portee( "50 yards" )
                                       .fin)
                    .fin

        v.to_s.must_equal @attendu
      end

      it "produit la meme chaine que l'objet construit explicitement meme si l'ordre de certains element varie" do
        v = Vehicule.nom( "Motojet 74-Z" )
                    .arme_vehicule(Arme.nom( "canon laser leger" )
                                       .quantite(1)
                                       .portee( "50 yards" )
                                       .fin)
                    .classe( "Motojet")
                    .fin

        v.to_s.must_equal @attendu
      end

      it "genere une exception si la finalisation n'est pas faite" do
        v = Vehicule.nom( "Motojet 74-Z" )
                    .classe( "Motojet")
                    .arme_vehicule(Arme.nom( "canon laser leger" )
                                       .quantite(1)
                                       .portee( "50 yards" )
                                       .fin)

        lambda { v.to_s }.must_raise DBC::Failure
      end
    end
  end
end
