require_relative 'spec-helper'
require 'persos'

module Persos
  describe Perso do
    describe "#complete?" do
      it "cree un personnage complet si tous les champs sont specifies" do
        p = Perso.nom( "Luke Skywalker" )
                 .planete( "Tatooine" )
                 .espece( "humain" )
                 .poste( "Jedi" )
                 .affiliation( "resistance" )
                 .arme(Arme.nom( "sabre laser" )
                           .quantite(1)
                           .portee( "corps a corps" )
                           .fin)
                 .vehicule(Vehicule.nom( "Motojet 74-Z" )
                                   .classe( "Motojet" )
                                   .arme_vehicule(Arme.nom( "canon laser léger" )
                                                      .quantite(1)
                                                      .portee( "50 yards" )
                                                      .fin)
                                 .fin).fin
        assert p.complete?
      end

      it "cree un personnage incomplet si l'espece n'est pas specifiee" do
        lambda do
          p = Perso.nom( "Luke Skywalker" )
                   .planete( "Tatooine" )
                   .poste( "Jedi" )
                   .affiliation( "resistance" )
                   .arme(Arme.nom( "sabre laser" )
                             .quantite(1)
                             .portee( "corps a corps" )
                             .fin)
                   .vehicule(Vehicule.nom( "Motojet 74-Z" )
                                     .classe( "Motojet" )
                                     .arme_vehicule(Arme.nom( "canon laser léger" )
                                                        .quantite(1)
                                                        .portee( "50 yards" )
                                                        .fin)
                                     .fin).fin.must_raise DBC::Failure
        end
      end

      it "cree un personnage incomplet si la planete n'est pas specifiee" do
        lambda do
          p = Perso.nom( "Luke Skywalker" )
                   .espece( "humain" )
                   .poste( "Jedi" )
                   .affiliation( "resistance" )
                   .arme(Arme.nom( "sabre laser" )
                             .quantite(1)
                             .portee( "corps a corps" )
                             .fin)
                   .vehicule(Vehicule.nom( "Motojet 74-Z" )
                                     .classe( "Motojet" )
                                     .arme_vehicule(Arme.nom( "canon laser léger" )
                                                        .quantite(1)
                                                        .portee( "50 yards" )
                                                        .fin)
                                     .fin).fin.must_raise DBC::Failure
        end
      end


      it "cree un personnage incomplet si l'affiliation n'est pas specifiee" do
        lambda do
          p = Perso.nom( "Luke Skywalker" )
                   .planete( "Tatooine" )
                   .espece( "humain" )
                   .poste( "Jedi" )
                   .arme(Arme.nom( "sabre laser" )
                             .quantite(1)
                             .portee( "corps a corps" )
                             .fin)
                   .vehicule(Vehicule.nom( "Motojet 74-Z" )
                                     .classe( "Motojet" )
                                     .arme_vehicule(Arme.nom( "canon laser léger" )
                                                        .quantite(1)
                                                        .portee( "50 yards" )
                                                        .fin)
                                     .fin).fin.must_raise DBC::Failure
        end
      end

      it "cree un personnage incomplet si le poste n'est pas specifie" do
        lambda do
          p = Perso.nom( "Luke Skywalker" )
                   .planete( "Tatooine" )
                   .espece( "humain" )
                   .affiliation( "resistance" )
                   .arme(Arme.nom( "sabre laser" )
                             .quantite(1)
                             .portee( "corps a corps" )
                             .fin)
                   .vehicule(Vehicule.nom( "Motojet 74-Z" )
                                     .classe( "Motojet" )
                                     .arme_vehicule(Arme.nom( "canon laser léger" )
                                                        .quantite(1)
                                                        .portee( "50 yards" )
                                                        .fin)
                                     .fin).fin.must_raise DBC::Failure
        end
      end

      it "cree un personnage complet si aucune arme n'est specifiee" do
        p = Perso.nom( "Luke Skywalker" )
                 .planete( "Tatooine" )
                 .espece( "humain" )
                 .poste( "Jedi" )
                 .affiliation( "resistance" )
                 .vehicule(Vehicule.nom( "Motojet 74-Z" )
                                   .classe( "Motojet" )
                                   .arme_vehicule(Arme.nom( "canon laser léger" )
                                                      .quantite(1)
                                                      .portee( "50 yards" )
                                                      .fin)
                                   .fin).fin
        assert p.complete?
      end

      it "cree un personnage complet si aucun vehicule n'est specifie" do
        p = Perso.nom( "Luke Skywalker" )
                 .planete( "Tatooine" )
                 .espece( "humain" )
                 .poste( "Jedi" )
                 .affiliation( "resistance" )
                 .arme(Arme.nom( "sabre laser" )
                           .quantite(1)
                           .portee( "corps a corps" )
                           .fin)
                   .fin
        assert p.complete?
      end
    end

    describe "DSL avec chainage de methode" do

      before do
        @attendu = c = Perso.new( "Luke Skywalker", 
          "Tatooine", 
          "humain", 
          "Jedi", 
          "resistance", 
          [Arme.new( "sabre laser", 1, "corps a corps" )], 
          [Vehicule.new( "Motojet 74-Z", "Motojet", 
            [Arme.new( "canon laser leger", 1, "50 yards" )] )] ).to_s
      end

      it "produit la meme chaine que l'objet construit explicitement" do
        p = Perso.nom( "Luke Skywalker" )
                 .planete( "Tatooine" )
                 .espece( "humain" )
                 .poste( "Jedi" )
                 .affiliation( "resistance" )
                 .arme(Arme.nom( "sabre laser" )
                           .quantite(1)
                           .portee( "corps a corps" )
                           .fin)
                 .vehicule(Vehicule.nom( "Motojet 74-Z" )
                                   .classe( "Motojet" )
                                   .arme_vehicule(Arme.nom( "canon laser leger" )
                                                      .quantite(1)
                                                      .portee( "50 yards" )
                                                      .fin)
                                 .fin).fin

        p.to_s.must_equal @attendu
      end

      it "produit la meme chaine que l'objet construit explicitement meme si l'ordre de certains element varie" do
        p = Perso.nom( "Luke Skywalker" )
                 .poste( "Jedi" )
                 .planete( "Tatooine" )
                 .vehicule(Vehicule.nom( "Motojet 74-Z" )
                                   .classe( "Motojet" )
                                   .arme_vehicule(Arme.nom( "canon laser leger" )
                                                      .quantite(1)
                                                      .portee( "50 yards" )
                                                      .fin)
                                 .fin)
                 .arme(Arme.nom( "sabre laser" )
                           .quantite(1)
                           .portee( "corps a corps" )
                           .fin)
                 .espece( "humain" )
                 .affiliation( "resistance" )
                 .fin

        p.to_s.must_equal @attendu
      end

      it "genere une exception si la finalisation n'est pas faite" do
        p = Perso.nom( "Luke Skywalker" )
                 .planete( "Tatooine" )
                 .poste( "Jedi" )
                 .affiliation( "resistance" )
                 .arme(Arme.nom( "sabre laser" )
                           .quantite(1)
                           .portee( "corps a corps" )
                           .fin)
                 .vehicule(Vehicule.nom( "Motojet 74-Z" )
                                   .classe( "Motojet" )
                                   .arme_vehicule(Arme.nom( "canon laser leger" )
                                                      .quantite(1)
                                                      .portee( "50 yards" )
                                                      .fin)
                                 .fin)

        lambda { p.to_s }.must_raise DBC::Failure
      end
    end
  end
end
