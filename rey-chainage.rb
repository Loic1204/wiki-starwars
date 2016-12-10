if __FILE__ == $0
  $LOAD_PATH.unshift( '.', 'lib' )
  require 'persos'
  include Persos
end

rey =
  Perso.nom( "Rey" ).
    planete( "Jakku" ).
    affiliation( "résistance" ).
    poste( "pilleuse" ).
    espece( "humaine" ).
    arme( "pistolet blaster", 1, "corps à corps" ).
    et( "sabre laser", 1, "corps à corps" ).
    vehicule( "motojet modifie", "motojet" ).
    arme_vehicule( "big gun", 2, "far" ).
    vehicule( "trotinette", "2 roues" ).
    arme_vehicule( "smol gun", 1, "not far" ).
    fin

if __FILE__ == $0
  puts rey
end

rey
