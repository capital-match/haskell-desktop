#!/bin/bash
set -x
set -o

desktop="haskell-desktop"
docker build -t capitalmatch/hstoolbuilder ./hs-toolbuilder
docker run --rm capitalmatch/hstoolbuilder tar -cvz -C .cabal-sandbox/bin . > $desktop/haskell-tools.tgz
docker build -t capitalmatch/$desktop ./$desktop
