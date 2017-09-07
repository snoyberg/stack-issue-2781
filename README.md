Reproducing case for: https://github.com/commercialhaskell/stack/issues/2781

To repro: run `./repro.sh`. (Imaginative, I know.)

`./cabal-repro.sh` will reproduce this using only Cabal-the-library (not Stack
or cabal-install). It only uses Stack to find the location of GHC; you can
comment out that bit if you have GHC 8.2.1 on your PATH already.
