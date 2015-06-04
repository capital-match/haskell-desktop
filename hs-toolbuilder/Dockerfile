FROM haskell:7.10.1

COPY Setup.hs .

RUN   cabal sandbox init

ADD https://www.stackage.org/snapshot/nightly-2015-05-04/cabal.config?download=true cabal.config

RUN cabal update && \
    cabal -j install ghc-mod stylish-haskell shake hasktags hdevtools hlint
