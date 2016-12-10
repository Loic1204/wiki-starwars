module Persos
  class Perso
    def initialize( nom,
                    planete,
                    espece,
                    poste,
                    affiliation,
                    armes,
                    vehicules )
      @nom = nom
      @planete = planete
      @espece = espece
      @poste = poste
      @affiliation = affiliation
      @armes = armes
      @vehicules = vehicules

      @complete = complete?
    end

    def complete?
      @complete ||=
        @planete && @espece && @poste && @affiliation
    end

    def to_s
      DBC.require( complete?, "*** Personnage a completer, il reste des champs vides " + inspect )

      armes = @armes.map { |a| a.to_s }.join("\n")
      vehicules = @vehicules.map { |v| v.to_s }.join("\n")

      #TODO: creation du fichier + ajout d'entete XML
      <<-EOS
      <personnage>
      	<nom>#{@nom}</nom>
      	<planete>#{@planete}</planete>
      	<espece>#{@espece}</espece>
      	<poste>#{@poste}</poste>
      	<affiliation>#{@affiliation}</affiliation>
#{armes}
#{vehicules}
      </personnage>
      EOS
    end
  end
end
