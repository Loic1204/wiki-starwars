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
    end

    describe "#to_s" do
      it "signale une exception lorsque non complet" do
        lambda do
          Perso.new( "", nil, nil, nil, nil, [], [] ).to_s
        end.must_raise DBC::Failure
      end

      it "retourne tous les elements du vehicule lorsque complet" do
        vehicule1 = Vehicule.new( "Motojet 74-Z", "Motojet", [Arme.new( "canon laser léger", 1, "50 yards" )] )
        arme1 = Arme.new( "sabre laser", 1, "corps a corps" )
        arme2 = Arme.new( "pistolet laser", "1", "30 yards" )

        c = Perso.new( "Luke Skywalker", 
          "Tatooine", 
          "humain", 
          "Jedi", 
          "resistance", 
          [ arme1, arme2 ], 
          [ vehicule1 ] )

        attendu = <<-EOS
      <personnage>
        <nom>Luke Skywalker</nom>
        <planete>Tatooine</planete>
        <espece>humain</espece>
        <poste>Jedi</poste>
        <affiliation>resistance</affiliation>
        <arme>
          <nom>sabre laser</nom>
          <quantite>1</quantite>
          <portee>corps a corps</portee>
        </arme>

        <arme>
          <nom>pistolet laser</nom>
          <quantite>1</quantite>
          <portee>30 yards</portee>
        </arme>

        <vehicule>
          <nom>Motojet 74-Z</nom>
          <classe>Motojet</classe>
        <arme>
          <nom>canon laser léger</nom>
          <quantite>1</quantite>
          <portee>50 yards</portee>
        </arme>

        </vehicule>

      </personnage>
        EOS
        c.to_s.must_equal attendu
      end
    end
  end
end
