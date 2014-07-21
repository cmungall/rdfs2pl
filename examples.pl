:- ensure_loaded( library(rdfs2pl) ).
:- use_module(library(semweb/rdf_db)).
:- use_module(library(semweb/rdf_turtle)).
:- use_module(library(semweb/rdf_http_plugin)).

pizzans('http://owl.cs.manchester.ac.uk/2009/07/sssw/pizza#').

load_pizza :-
        rdf_load('tests/pizza.owl').

load_ro :-
        rdf_load('tests/ro.ttl').

w_pizza :-
        pizzans(URL),
        load_pizza,
        write_schema(pizza,URL,[use_labels(true)]).

w_ro :-
        load_ro,
        write_schema(ro,'http://purl.obolibrary.org/obo/RO_',[use_labels(true)]).

/*

  swipl -g "[examples],w_ro,halt." > ro.pl
  
*/
