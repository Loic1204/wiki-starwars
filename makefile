DEFAUT=exemple_dsl tests_dsl tests

# Cible par defaut.
default: $(DEFAUT)

#################################################################
# Exemple d'utilisation du DSL
exemple_dsl:
	@echo "* Exemple d'execution *"
	ruby rey-chainage.rb

# Tests du DSL
tests_dsl:
	@echo
	@echo "* Execution des tests unitaires *"
	ruby spec/arme-dsl-chainage_spec.rb
	ruby spec/vehicule-dsl-chainage_spec.rb
	ruby spec/perso-dsl-chainage_spec.rb

#################################################################
# Tests unitaires pour les classes de base
tests:
	ruby spec/arme_spec.rb
	ruby spec/vehicule_spec.rb
	ruby spec/perso_spec.rb

#################################################################
# Nettoyage du repertoire.
clean:
	rm -f *~
