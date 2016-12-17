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
        lambda do
          a = Arme.nom( "Colt 1855 Sidehammer")
                  .portee( "25 yards" )
                  .fin.must_raise DBC::Failure
        end
      end

      it "cree une arme incomplete si la portee n'est pas specifiee" do
        lambda do
          a = Arme.nom( "Colt 1855 Sidehammer")
                  .quantite(1)
                  .fin.must_raise DBC::Failure
        end
      end
    end

    describe "DSL avec chainage de methode" do

      before do
        @attendu = Arme.new( "Colt 1855 Sidehammer", 1, "25 yards" ).to_s
      end

      it "produit la meme chaine que l'objet construit explicitement" do
        a = Arme.nom( "Colt 1855 Sidehammer" )
                .quantite( 1 )
                .portee( "25 yards" )
                .fin

        a.to_s.must_equal @attendu
      end

      it "produit la meme chaine que l'objet construit explicitement meme si l'ordre de certains element varie" do
        a = Arme.nom( "Colt 1855 Sidehammer" )
                .portee( "25 yards" )
                .quantite( 1 )
                .fin
        a.to_s.must_equal @attendu
      end
    end
  end
end
