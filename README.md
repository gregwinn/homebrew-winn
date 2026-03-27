# Homebrew Tap for Winn

[Winn](https://github.com/gregwinn/winn-lang) is a Ruby/Elixir-inspired language that compiles to the BEAM (Erlang VM).

## Install

```sh
brew tap gregwinn/winn
brew install winn
```

## Usage

```sh
# Create a new project
winn new my_app

# Run a Winn file
winn run hello.winn

# Compile to .beam
winn compile src/app.winn

# Show help
winn help
```

## Upgrade

```sh
brew upgrade winn
```

## Uninstall

```sh
brew uninstall winn
brew untap gregwinn/winn
```
