#!/bin/bash
set -x
set -o

desktop="haskell-desktop"
tag="7.10.2"
docker build -t capitalmatch/hstoolbuilder:$tag ./hs-toolbuilder
docker run --rm capitalmatch/hstoolbuilder tar -cvz -C .cabal-sandbox/bin . > $desktop/haskell-tools.tgz
docker build -t capitalmatch/$desktop:$tag ./$desktop
