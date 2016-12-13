require_relative 'spec-helper'
require 'persos'

module Persos
  describe Perso do
    describe "#complete?" do
      it "cree un personnage complet si tous les champs sont specifies" do
        c = Perso.new( "Luke Skywalker", 
          "Tatooine", 
          "humain", 
          "Jedi", 
          "resistance", 
          [Arme.new( "sabre laser", 1, "corps a corps" )], 
          [Vehicule.new( "Motojet 74-Z", "Motojet", 
            [Arme.new( "canon laser léger", 1, "50 yards" )] )] )
        assert c.complete?
      end

      it "cree un personnage incomplet si l'espece n'est pas specifiee" do
        c = Perso.new( "Luke Skywalker", 
          "Tatooine", 
          nil, 
          "Jedi", 
          "resistance", 
          [Arme.new( "sabre laser", 1, "corps a corps" )], 
          [Vehicule.new( "Motojet 74-Z", "Motojet", 
            [Arme.new( "canon laser léger", 1, "50 yards" )] )] )
        refute c.complete?
      end

      it "cree un personnage incomplet si la planete n'est pas specifiee" do
        c = Perso.new( "Luke Skywalker", 
          nil, 
          "humain", 
          "Jedi", 
          "resistance", 
          [Arme.new( "sabre laser", 1, "corps a corps" )], 
          [Vehicule.new( "Motojet 74-Z", "Motojet", 
            [Arme.new( "canon laser léger", 1, "50 yards" )] )] )
        refute c.complete?
      end


      it "cree un personnage incomplet si l'affiliation n'est pas specifiee" do
        c = Perso.new( "Luke Skywalker", 
          "Tatooine", 
          "humain", 
          "Jedi", 
          nil, 
          [Arme.new( "sabre laser", 1, "corps a corps" )], 
          [Vehicule.new( "Motojet 74-Z", "Motojet", 
            [Arme.new( "canon laser léger", 1, "50 yards" )] )] )
        refute c.complete?
      end

      it "cree un personnage incomplet si le poste n'est pas specifie" do
        c = Perso.new( "Luke Skywalker", 
          "Tatooine", 
          "humain", 
          nil, 
          "resistance", 
          [Arme.new( "sabre laser", 1, "corps a corps" )], 
          [Vehicule.new( "Motojet 74-Z", "Motojet", 
            [Arme.new( "canon laser léger", 1, "50 yards" )] )] )
        refute c.complete?
      end

      it "cree un personnage complet si aucune arme n'est specifiee" do
        c = Perso.new( "Luke Skywalker", 
          "Tatooine", 
          "humain", 
          "Jedi", 
          "resistance", 
          nil, 
          [Vehicule.new( "Motojet 74-Z", "Motojet", 
            [Arme.new( "canon laser léger", 1, "50 yards" )] )] )
        assert c.complete?
      end

      it "cree un personnage complet si aucun vehicule n'est specifie" do
        c = Perso.new( "Luke Skywalker", 
          "Tatooine", 
          "humain", 
          "Jedi", 
          "resistance", 
          [Arme.new( "sabre laser", 1, "corps a corps" )], 
          nil )
        assert c.complete?
      end

    #TODO describe "#to_s" do
    end
  end
end
