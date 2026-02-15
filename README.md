# Dotfiles

My personal configuration files managed with [chezmoi](https://www.chezmoi.io/).

## Included Configurations
- **Shell**: Zsh with [Oh My Zsh](https://ohmyz.sh/)
- **Prompt**: [Starship](https://starship.rs/)
- **Editor**: [Neovim](https://neovim.io/) (LazyVim based)
- **Runtime Manager**: [Mise](https://mise.jdx.dev/) (manages Node.js, Neovim, etc.)
- **CLI Tools**: Rust, Ripgrep, FD, Gemini CLI, Opencode AI

## Installation

To apply these dotfiles on a fresh instance, follow these steps:

### 1. Install chezmoi
```bash
sh -c "$(curl -fsLS get.chezmoi.io)"
```

### 2. Initialize and Apply
Replace `USER` with your GitHub username:
```bash
# Initialize and apply immediately
bin/chezmoi init --apply USER

# OR if chezmoi is already in your PATH
chezmoi init --apply USER
```

### 3. Post-installation
The `run_once_setup.sh` script will automatically trigger during the first `chezmoi apply`. It will:
- Install essential system packages via `apt`.
- Set up Oh My Zsh.
- Install Starship and Mise.
- Install the latest versions of Neovim, Node.js, and Rust.
- Install Gemini CLI and Opencode AI.

**Note:** You may be prompted for your `sudo` password to install system packages.

### 4. Reload Shell
After the installation completes, restart your terminal or run:
```bash
exec zsh
```

## Structure
- `dot_config/`: Configuration files (Neovim, Starship)
- `dot_zshrc`: Zsh configuration
- `run_once_setup.sh`: Automated system setup script
