# Dotfiles

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/benfranzi/dotfiles/main/go.sh | bash
```

Or clone and run manually:

```bash
git clone https://github.com/benfranzi/dotfiles.git ~/dotfiles && ~/dotfiles/install.sh
```

## Development
- Run `make -f development/Makefile.dev ubuntu` or `make -f development/Makefile.dev darwin`
- In container, run `./install.sh`
- To test install, run `./development/validate.sh`