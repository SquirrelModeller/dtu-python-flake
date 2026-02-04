# dtu-python-flake

A Python development environment for DTU [first year and other courses](https://pythonsupport.dtu.dk/install/python.html), provided as a Nix flake.

The flake exposes a `devShell` with Python 3.12, Jupyter, and common scientific packages used at DTU.

---

## Usage

### Recommended usage

For DTU courses, the simplest workflow is to copy the flake into your course repository and let `direnv` handle the environment automatically.

1. Copy `flake.nix` and `.envrc` into the root of your course project.
2. From that directory, allow the environment:
```bash
direnv allow
```
3. Reload your IDE environment.

At this point, the development environment is active. Python 3.12 and all packages are available.

If you use VS Code, VSCodium, or any other IDE with a `direnv` extension installed, the environment will be picked up automatically after reloading the editor.



### Enter the development shell

From the repository root:

```bash
nix develop
```
Or without cloning:
```bash
nix develop github:SquirrelModeller/dtu-python-flake
```

### VS Code

If you use VS Code, the direnv extension integrates automatically: https://marketplace.visualstudio.com/items?itemName=mkhl.direnv

#### Automatic VS Code setup

A Nix flake providing a complete VS Code / VSCodium setup (including essential is available here:

https://github.com/SquirrelModeller/squirrel-nixos/blob/main/modules/graphical/apps/vscodium.nix
