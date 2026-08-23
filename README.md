# TylerAngelier Tap

This is Tyler Angelier's personal Homebrew tap.

## How do I install these formulae?

`brew install tylerangelier/tap/<formula>`

Or `brew tap tylerangelier/tap` and then `brew install <formula>`.

Or, in a `brew bundle` `Brewfile`:

```ruby
tap "tylerangelier/tap"
brew "<formula>"
```

## Smoke-test service

`hello-world-service` validates the path from a GitHub release artifact to a
Homebrew formula and a user-level `brew services` process.

```sh
brew install tylerangelier/tap/hello-world-service
brew services start tylerangelier/tap/hello-world-service
tail -f "$(brew --prefix)/var/log/hello-world-service.log"
```

Stop it with:

```sh
brew services stop tylerangelier/tap/hello-world-service
```

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
