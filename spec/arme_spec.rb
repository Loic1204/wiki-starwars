require_relative 'spec-helper'
require 'persos'

module Persos
  describe Arme do
    describe "#complete?" do
      it "cree une arme complete si tous les champs sont specifies" do
        c = Arme.new( "Colt 1855 Sidehammer", 1, "25 yards" )
        assert c.complete?
      end

      it "cree une arme incomplete si la quantite n'est pas specifiee" do
        c = Arme.new( "Colt 1855 Sidehammer", nil, "25 yards" )
        refute c.complete?
      end

      it "cree une arme incomplete si la portee n'est pas specifiee" do
        c = Arme.new( "Colt 1855 Sidehammer", 1, nil )
        refute c.complete?
      end

    #TODO describe "#to_s" do
    end
  end
end
