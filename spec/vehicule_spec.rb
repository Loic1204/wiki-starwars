require_relative 'spec-helper'
require 'persos'

module Persos
  describe Vehicule do
    describe "#complete?" do
      it "cree un vehicule complet si tous les champs sont specifies" do
        c = Vehicule.new( "Motojet 74-Z", "Motojet", 
          [Arme.new( "canon laser léger", 1, "50 yards" )] )
        assert c.complete?
      end

      it "cree un vehicule incomplet si la classe n'est pas specifiee" do
        c = Vehicule.new( "Motojet 74-Z", nil, 
          [Arme.new( "canon laser léger", 1, "50 yards" )] )
        refute c.complete?
      end

      it "cree un vehicule complet si aucune arme n'est specifiee" do
        c = Vehicule.new( "Motojet 74-Z", "Motojet", nil )
        assert c.complete?
      end

    #TODO describe "#to_s" do
    end
  end
end
