#!/bin/bash
set -x
set -o

docker build -t capitalmatch/hstoolbuilder ./hstoolbuilder
docker run --rm toolbuilder tar -cvz -C .cabal-sandbox/bin . > big-monolith/haskell-tools.tgz
docker build -t capitalmatch/haskell-desktop ./haskell-desktop
