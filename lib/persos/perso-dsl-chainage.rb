module Persos
  class Perso

    #
    # Methodes specifiques au DSL.
    #

    def self.nom( nom )
      perso = Perso.new( nom, nil, nil, nil, nil, [], [] )

      perso
    end

    def planete( planete )
      @planete = planete

      self
    end

    def espece( espece )
      @espece = espece

      self
    end

    def poste( poste )
      @poste = poste

      self
    end

    def affiliation( affiliation )
      @affiliation = affiliation

      self
    end

    def arme( arme )
      @armes << arme

      self
    end

    alias :et :arme

    def vehicule( vehicule )
      @vehicules << vehicule

      self
    end

    def fin
      DBC.assert complete?

      self
    end
  end
end
