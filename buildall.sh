#!/bin/bash
set -x
set -o

docker build -t capitalmatch/hstoolbuilder ./hs-toolbuilder
docker run --rm toolbuilder tar -cvz -C .cabal-sandbox/bin . > big-monolith/haskell-tools.tgz
docker build -t capitalmatch/haskell-desktop ./haskell-desktop
