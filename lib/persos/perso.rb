module Perso
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
    end

    def to_s
      armes = @armes.map { |a| a.to_s }.join("\n")
      vehicules = @vehicules.map { |v| v.to_s }.join("\n")

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
