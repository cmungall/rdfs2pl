## Synopsis

    :- ensure_loaded( library(rdfs2pl) ).
    :- use_module(library(semweb/rdf_db)).
    
    gen :-
            pizzans(URL),
            rdf_load('pizza.owl'),
            tell('pizza.pl'),
            write_schema(pizza,'http://owl.cs.manchester.ac.uk/2009/07/sssw/pizza#',[use_labels(true)]),
            told.

Command line wrapper:

    rdfs2pl pizza pizza.owl > pizza.pl

## Description

Compiles an RDFS schema to prolog wrapper predicates. For example, if the ontology contains

    :hasTopping a owl:ObjectProperty ;
        rdfs:label "has topping" .

Then the generated module will contain

    :- rdf_meta has_topping(r,r).
    :- op(300,xfy,has_topping/2).
    has_topping(X,Y) :- rdf_has(X,pizza:hasTopping,Y).

A unary predicate is also created for every class

This allows convenient querying of the form:

    write_pizza_toppings :-
        pizza(P),
        P has_topping T,
        writeln(P-T),
        fail.

## Installation

    ?- pack_install(rdfs2pl).

## Quickstart

    rdfs2pl pizza pizza.owl > pizza.pl


## Project

Source code available and pull requests accepted at http://github.com/cmungall/rdfs2pl
    
