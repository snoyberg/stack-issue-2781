#!/usr/bin/env bash

set -eux

rm -rf foo/dist
rm -rf bar/dist
rm -rf pkgdb

export PATH=$(stack path --bin-path)

ghc-pkg init pkgdb
PKGDB=$(pwd)/pkgdb

(
    cd foo
    cp v1/Foo.hs src/Foo.hs
    runghc Setup.hs configure --package-db=clear --package-db=global --package-db=$PKGDB
    runghc Setup.hs build
    runghc Setup.hs copy
    runghc Setup.hs register
)

(
    cd bar
    runghc Setup.hs configure --package-db=clear --package-db=global --package-db=$PKGDB --enable-benchmarks
    runghc Setup.hs build
)

(
    cd foo
    cp v2/Foo.hs src/Foo.hs
    runghc Setup.hs configure --package-db=clear --package-db=global --package-db=$PKGDB
    runghc Setup.hs build
    runghc Setup.hs copy
    runghc Setup.hs register
)

(
    cd bar
    runghc Setup.hs build
)
