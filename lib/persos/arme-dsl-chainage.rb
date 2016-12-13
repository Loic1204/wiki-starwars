module Persos
  class Arme

    #
    # Methodes specifiques au DSL.
    #

    def self.nom( nom )
      arme = Arme.new( nom, nil, nil )

      arme
    end

    def quantite( quantite )
      @quantite = quantite

      self
    end

    def portee( portee )
      @portee = portee

      self
    end

    def fin
      DBC.assert complete?

      self
    end
  end
end
