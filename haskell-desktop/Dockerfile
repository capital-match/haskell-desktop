FROM mostalive/dockerx2go
# X / X2go is stable and has lots of dependencies to install, so that comes first in the chain
# This Dockerfile sorted by stability, not functionality to reduce layers and build time
 
RUN locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8
ENV DEFAULTUSER dockerx
ENV GHC_VERSION=7.10.2
ENV CABAL_VERSION=1.22

# install ghc, emacs tmux and friends
RUN add-apt-repository -y ppa:hvr/ghc && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y build-essential git locales binutils ghc-$GHC_VERSION cabal-install-$CABAL-VERSION alex happy zlib1g-dev libtinfo-dev libgmp10 emacs24 vim tmux curl

# install haskell tools for emacs
ADD haskell-tools.tgz /usr/local/bin/

# install cabal stuff as DEFAULTUSER
USER $DEFAULTUSER
ENV HOME  /home/$DEFAULTUSER
WORKDIR $HOME

ENV PATH /home/$DEFAULTUSER/.cabal/bin:/opt/cabal/$CABAL_VERSION/bin:/opt/ghc/GHC_VERSION/bin:$PATH

RUN cabal update && \
    cabal install Cabal-CABAL_VERSION

RUN echo "export PATH=\$HOME/.cabal/bin:/opt/cabal/1.20/bin:/opt/ghc/7.8.4/bin:\$PATH" >> ~/.bashrc

# install emacs packages
RUN git clone https://github.com/capital-match/haskell-emacs.git && \
    ln -s haskell-emacs/dot-emacs.el .emacs && \
    haskell-emacs/emacs-install-packages.sh

# reset user to root
USER root
