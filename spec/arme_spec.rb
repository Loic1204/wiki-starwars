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
    end

    describe "#to_s" do
      it "signale une exception lorsque non complete" do
        lambda do
          Arme.new( "", nil, nil ).to_s
        end.must_raise DBC::Failure
      end

      it "retourne tous les attributs de l'arme quand complete" do
        c = Arme.new( "Colt 1855 Sidehammer", 1, "25 yards" )

        attendu = <<-EOS
        <arme>
          <nom>Colt 1855 Sidehammer</nom>
          <quantite>1</quantite>
          <portee>25 yards</portee>
        </arme>
        EOS

        c.to_s.must_equal attendu
      end
    end
  end
end
