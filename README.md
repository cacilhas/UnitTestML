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
