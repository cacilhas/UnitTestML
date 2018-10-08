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


### Installation using Smackage

Alternatively you can
install [Smackage](http://www.elsman.com/lessons/2014/10/02/getting-started-with-smackage)
and manage your libs using it.

After installed Smackage, add UnitTestML to Smackage, and install it:

```sh
smackage source UnitTestML git https://cacilhas@bitbucket.org/cacilhas/unittestml.git
smackage refresh
smackage get UnitTestML
```


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

Or if you used Smackage for installing:

```sml
(* tests/test.mlb *)
local
  $(ML_LIB)/basis/basis.mlb
  $(SMACKAGE)/UnitTestML/v1/unittest.mlb
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

For code consistency, we recommend using the
[`"allowOptSemicolon true"` *ann*](http://mlton.org/MLBasisAnnotations).
See [`test.mlb`](https://bitbucket.org/cacilhas/unittestml/src/master/tests/test.mlb)
for an example.
