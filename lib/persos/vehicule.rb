module Persos
  class Vehicule
    attr_reader :nom, :classe, :armes

    def initialize( nom, classe, armes )
      @nom = nom
      @classe = classe
      @armes = armes
    end

    def to_s
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
