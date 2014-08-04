Playground for learning Haskell (with Emacs and haskell-mode).

```
cabal init
touch README.md
touch LICENSE
cabal sandbox init

perl -p -i -e 's/^.*main-is.*$/  main-is: Main.hs/' learn-haskell.cabal
echo 'main = putStrLn "Hello world!"' > Main.hs

cabal install
.cabal-sandbox/bin/learn-haskell
```