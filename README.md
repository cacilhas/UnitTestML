[annotations]: http://mlton.org/MLBasisAnnotations
[mlton]: http://mlton.org/
[smackage]: http://www.elsman.com/lessons/2014/10/02/getting-started-with-smackage
[sml]: http://sml-family.org/
[specs.sml]: https://github.com/cacilhas/UnitTestML/blob/master/tests/specs.sml
[test.mlb]: https://github.com/cacilhas/UnitTestML/blob/master/tests/test.mlb

# UnitTestML

A unit test support for [Standard ML][sml] using [MLton][mlton].

## Running tests

```sh
git clone git@github.com:cacilhas/UnitTestML.git
cd unittestml/
mlton tests/test.mlb
./tests/test
```

## Installing

Install [Smackage][smackage] in order to manage your libs.

With Smackage installed, add UnitTestML to it and install:

```sh
smackage source UnitTestML git https://github.com/cacilhas/UnitTestML.git
smackage refresh
smackage get UnitTestML
```

## Usage

Create a subdirectory `tests/` inside your code’s root directory containing
the following MLBasis:

```sml
(* tests/test.mlb *)
local
  $(SML_LIB)/basis/basis.mlb
  $(SMACKAGE)/UnitTestML/v1/unittest.mlb
  (* Your project’s MLBasis file here *)
in
  (*
   * Reference the spec files inside tests/ here
   *)
end
```

The file [`specs.sml`][specs.sml] in this very repository is a usage example:
create a `describe` spec in each spec file containing other `describe` specs
or tests (`it` *fun*) themselves.

For code consistency, we recommend using the
[`"allowOptSemicolon true"` *ann*][annotations].
See [`test.mlb`][test.mlb] for an example.
