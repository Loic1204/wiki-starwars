require_relative 'spec-helper'
require 'persos'

module Persos
  describe Arme do
    describe "#complete?" do
      it "cree une arme complete si tous les champs sont specifies" do
        a = Arme.nom( "Colt 1855 Sidehammer" )
                .quantite( 1 )
                .portee( "25 yards" )
                .fin
        assert a.complete?
      end

      it "cree une arme incomplete si la quantite n'est pas specifiee" do
        a = Arme.nom( "Colt 1855 Sidehammer")
                .portee( "25 yards" )
                .fin
        refute a.complete?
      end

      it "cree une arme incomplete si la portee n'est pas specifiee" do
        a = Arme.nom( "Colt 1855 Sidehammer")
                .quantite(1)
                .fin
        refute a.complete?
      end

    #TODO describe "#to_s" do
    end
  end
end
