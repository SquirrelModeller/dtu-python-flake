# dtu-python-flake

A Python development environment for DTU [first year and other courses](https://pythonsupport.dtu.dk/install/python.html), provided as a Nix flake.

The flake exposes a `devShell` with Python 3.12, Jupyter, and common scientific packages used at DTU.

---

## Usage

### Enter the development shell

From the repository root:

```bash
nix develop
```
Or without cloning:
```bash
nix develop github:SquirrelModeller/dtu-python-flake
```

## Optional: direnv


This repository includes a minimal `.envrc` for use with `direnv`.

If you have `direnv` installed, enable it once:

```bash
direnv allow
```

### VS Code

If you use VS Code, the direnv extension integrates automatically: https://marketplace.visualstudio.com/items?itemName=mkhl.direnv


#### Automatic VS Code setup

A Nix flake providing a complete VS Code / VSCodium setup (including essential is available here:

https://github.com/SquirrelModeller/squirrel-nixos/blob/main/modules/graphical/apps/vscodium.nix
