# Big monolithic container with emacs and haskell

## Purpose

To give you and your team a fully working haskell and emacs development environment
without the headache of setting one up, and a place to program in a pair
or in larger groups when you are distributed, e.g. a distributed team or
an online [coding dojo](http://codingdojo.org). 

You can opt for the headache later, once you are familiar enough with haskell and emacs if you so
desire. 

## Usage

### Start a container

Run, and make sure you expose the ssh port:

`docker run --name haskell-desktop -p 2022:22 capitalmatch/haskell-desktop`

A randomly generated password for `root` and user `dockerx` will be
printed. Keep this handy for the next step.

### Interact with the container

There are three ways to use this:

1. In a terminal through `ssh`, with tmux support built in
2. Individual windows through `ssh -X`
3. Full screen, multiple windows with X2go (`x2goclient`)

For a group of people Option 1. is best, because tmux does not limit the number
of users. Option 2 is great if you work on your own, perhaps locally.
You will get a shell from where you can start e.g. emacs in graphical
mode, and it will blend in with the rest of your applications. Option 3
is great if you want to work remotely with one other person on a web
application and share an editor, terminal and web browser, or if you
want a full desktop environment.


1. `ssh dockerx@<hostname> -p 2022`
2. `ssh -X dockerx@<hostname> -p 2022`
3. `x2goclient` and then configure host, port and user. `CTRL-ALT-F`
   goes to full screen. You need this, otherwise [Alt-tab, and in emacs
M-x will not
work](http://lists.x2go.org/pipermail/x2go-user/2014-August/002393.html)

## Contributing

Our emacs configuration works, but could probably do with some love by
someone who understands haskell-mode better than we do.

## Motivation

Haskell development is fun, enriching and can be very productive.
Setting up a development environment with all the bells and whistles can
be made easier. We mainly use emacs, and while haskell-mode is great, it
needs several binaries to do its work and some configuration. Teams work
better if everyone has a working environment they don't have to worry
about. Sharing an environment, or at least the code that builds the
environment makes it possible to get there.

We are also distributed, so we need a good online environment to pair
program and run [coding dojos](http://www.codingdojo.org). This Docker
image is our nth attempt at getting to this. Thanks to stackage
installing tools such as ghc-mod is now a lot easier, but alltogether
there are still quite a few moving parts.




