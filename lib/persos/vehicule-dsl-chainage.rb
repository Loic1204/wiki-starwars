module Persos
  class Vehicule

    #
    # Methodes specifiques au DSL.
    #

    def self.nom( nom )
      vehicule = Vehicule.new( nom, nil, [] )

      vehicule
    end

    def classe( classe )
      @classe = classe

      self
    end

    def arme_vehicule( nom, quantite, portee )
      @armes << Arme.nom( nom ).
        quantite( quantite ).
        portee( portee ).
        fin

      self
    end

    alias :et :arme_vehicule

    def fin
      DBC.assert complete?

      self
    end
  end
end
