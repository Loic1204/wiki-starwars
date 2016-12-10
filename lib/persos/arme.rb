module Persos
  class Arme
    attr_reader :nom
    attr_reader :quantite
    attr_reader :portee

    def initialize( nom, quantite, portee )
      @nom, @quantite, @portee = nom, quantite, portee
    end

    def to_s
      <<-EOS
      <arme>
      <nom>#{@nom}</nom>
      <quantite>#{@quantite}</quantite>
      <portee>#{@portee}</portee>
      </arme>
      EOS
    end
  end
end
