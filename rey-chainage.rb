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

    arme( Arme.nom( "pistolet blaster" ).
      quantite( 1 ).
      portee( "corps à corps" ).
      fin).

    vehicule( Vehicule.nom( "motojet modifie" ).
      classe( "motojet" ).
      arme_vehicule( Arme.nom( "big gun" ).
        quantite( 2 ).
        portee( "far" ).
        fin).
      fin).

    vehicule( Vehicule.nom( "trotinette" ).
      classe( "2 roues" ).
      arme_vehicule( Arme.nom( "smol gun" ).
        quantite( 1 ).
        portee( "not far" ).
        fin).
      fin).

    et( Arme.nom( "sabre laser" ).
      quantite( 1 ).
      portee( "corps à corps" ).
      fin).
    fin

if __FILE__ == $0
  puts rey
end

rey
