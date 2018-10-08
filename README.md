# UnitTestML

A unit test support for [Standard ML](http://sml-family.org/)
using [MLton](http://mlton.org/).


## Running tests

```sh
git clone git@bitbucket.org:cacilhas/unittestml.git
cd unittestml/
mlton tests/test.mlb
./tests/test
```


## Installing

Clone this repository into an MLton library directory, as `$(ML_LIB)`,
or create an entrypoint in the `mlb-path-map` file pointing the cloned local
repository.


## Usage

Assuming the `unittestml/` directory is inside `$(ML_LIB)`,
create a directory `tests/` in your code’s root containing
the following MLBasis:

```sml
(* tests/test.mlb *)
local
  $(ML_LIB)/basis/basis.mlb
  $(ML_LIB)/unittestml/unittest.mlb
  (* Your project’s MLBasis file here *)
in
  (*
   * Reference the spec files inside tests/ here
   *)
end
```

The file [`specs.sml`](https://bitbucket.org/cacilhas/unittestml/src/master/tests/specs.sml)
in this very repository is a usage example:
create a `describe` spec in each spec file containing other `describe` specs
or tests (`it` *fun*) themselves.

For code consistency, we recommend using the `"allowOptSemicolon true"` *ann*.
See [`test.mlb`](https://bitbucket.org/cacilhas/unittestml/src/master/tests/test.mlb)
for an example.
