module Persos
  class Perso

    #
    # Methodes specifiques au DSL.
    #

    def self.nom( nom )
      perso = Perso.new( nom, nil, nil, nil, nil, [], [] )
      $numero_vehicule = -1

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

    def arme( nom, quantite, portee )
      @armes << Arme.new( nom, quantite, portee )

      self
    end

    alias :et :arme

    def vehicule( nom, classe )
      @vehicules << Vehicule.new( nom, classe, [] )
      $numero_vehicule += 1

      self
    end

    def arme_vehicule( nom, quantite, portee )
      @vehicules[$numero_vehicule].armes << Arme.new( nom, quantite, portee ) unless $numero_vehicule < 0

      self
    end

    alias :avec :arme_vehicule
    alias :arme_de :arme_vehicule

    def fin
      DBC.assert complete?

      self
    end
  end
end
