## Synopsis

Given an ontology `pizza.owl`:

    :- ensure_loaded( library(rdfs2pl) ).
    :- use_module(library(semweb/rdf_db)).
    
    gen :-
            rdf_load('pizza.owl'),
            tell('pizza.pl'),
            write_schema(pizza,'http://owl.cs.manchester.ac.uk/2009/07/sssw/pizza#',[use_labels(true)]),
            told.

Alternatively, use the command line wrapper:

    rdfs2pl pizza pizza.owl -o pizza.pl

## Description

Compiles an RDFS schema to prolog program consisting of convenience wrapper predicates:

 * unary predicate for every class in the ontology
 * binary predicate for every property in the ontology

For example, if the ontology contains

    :hasTopping a owl:ObjectProperty ;
        rdfs:label "has topping" .

Then the generated module will contain

    :- rdf_meta has_topping(r,r).
    :- op(300,xfy,has_topping/2).
    has_topping(X,Y) :- rdf_has(X,pizza:hasTopping,Y).

This allows convenient querying of the form:

    write_pizza_toppings :-
        pizza(P),
        P has_topping T,
        writeln(P-T),
        fail.

## Optional Extras

Additional arguments are provided where we want to determine the named
graph a triple is asserted in, or inspect the reification of the
statement/axiom. Note OWL uses a different reification vocabulary than RDF.

 * Clauses of the form `P(S,O,G)` where `G` is the graph `S-P-O` is asserted in
 * Clauses of the form `P(S,O,G,N)` where `N` is the node of the reified statement
 * Clauses of the form `P_node(S,O,N)` where `N` is the node of the reified statement
 * Clauses of the form `P_axiom(S,O,A)` where `A` is the node of the axiom reified using the owl vocabulary

These are on by default. These can be controlled via `Opts` in write_schema/3, or by command line options.

## Installation

    ?- pack_install(rdfs2pl).

## Quickstart

    rdfs2pl pizza pizza.owl -o pizza.pl

For all options, see

    rdfs2pl -h

## Examples

 * https://github.com/cmungall/obo_metadata

## Project

Source code available and pull requests accepted at http://github.com/cmungall/rdfs2pl
    
