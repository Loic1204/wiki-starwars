module Persos
  class Vehicule
    attr_reader :nom, :classe, :armes

    def initialize( nom, classe, armes )
      @nom = nom
      @classe = classe
      @armes = armes

      @complete = complete?
    end

    def complete?
      @classe
    end

    def to_s
      DBC.require( complete?, "*** Vehicule a completer, il reste des champs vides " + inspect )

      armes = @armes.map { |a| a.to_s }.join("\n")

      <<-EOS
      <vehicule>
      	<nom>#{@nom}</nom>
      	<classe>#{@classe}</classe>
      	<portee>#{@portee}</portee>
#{armes}
      </vehicule>
      EOS
    end
  end
end
