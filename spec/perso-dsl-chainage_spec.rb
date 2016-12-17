require_relative 'spec-helper'
require 'persos'

module Persos
  describe Perso do
    describe "#complete?" do
      it "cree un personnage complet si tous les champs sont specifies" do
        p = Perso.new
                 .nom( "Luke Skywalker" )
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
        p = Perso.new
                 .nom( "Luke Skywalker" )
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
                                   .fin).fin
        refute p.complete?
      end

      it "cree un personnage incomplet si la planete n'est pas specifiee" do
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
                                   .fin).fin
        refute p.complete?
      end


      it "cree un personnage incomplet si l'affiliation n'est pas specifiee" do
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
                                   .fin).fin
        refute p.complete?
      end

      it "cree un personnage incomplet si le poste n'est pas specifie" do
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
                                   .fin).fin
        refute p.complete?
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

    #TODO describe "#to_s" do
    end
  end
end
