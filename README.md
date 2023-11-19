# dotfiles

```sh
git clone https://github.com/AconCavy/dotfiles.git
```

## Commands

### Setup

Setup the OS settings and softwares.

```sh
./scripts/setup.sh
```

### Link

Create a symlink of the dotfiles to the `$HOME` directory.  
If a dotfile with the same name exists in `$HOME` directory, move it to the `$HOME/.dotbackup` directory.

```sh
./scripts/link.sh
```

### Unlink

Delete a symlink of the dotfiles from the `$HOME` directory.  
If a dotfile exists in the `$HOME/.dotbackup` directory, move it to the `$HOME` directory.

```sh
./scripts/unlink.sh
```

## Configure dotfiles

Place shared dotfiles in the `./dotfiles`.  
Place OS-specific dotfiles in the `./dotfiles_{OS}` for each OS.
