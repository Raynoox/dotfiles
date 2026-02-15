#!/bin/bash
echo "🚀 Rozpoczynam automatyczną instalację środowiska..."

echo "📦 Instalacja pakietów systemowych..."
sudo apt update && sudo apt install -y zsh git curl ripgrep fd-find build-essential unzip pass gnupg

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "✨ Instalacja Oh-My-Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  sudo chsh -s $(which zsh) $USER
fi

if ! command -v starship &> /dev/null; then
  echo "🌟 Instalacja Starship..."
  curl -sS https://starship.rs/install.sh | sh -s -- -y
fi

if [ ! -f "$HOME/.local/bin/mise" ]; then
  echo "🛠️ Instalacja Mise..."
  curl https://mise.run | sh
fi

echo "🟢 Instalacja Neovima..."
~/.local/bin/mise use --global neovim@latest

echo "🟩 Instalacja Node.js (zawiera npm)..."
~/.local/bin/mise use --global node@latest

echo "Instalacja opencode"
~/.local/bin/mise exec node -- npm install -g opencode-ai

echo "Instalacja gemini CLI"
~/.local/bin/mise exec node -- npm install -g @google/gemini-cli

if ! command -v cargo &> /dev/null; then
  echo "🦀 Instalacja Rust (via rustup)..."
  # Flaga -y zapewnia instalację bez pytań (unattended)
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  
  # Ładowanie środowiska Rusta do obecnej sesji skryptu
  . "$HOME/.cargo/env"
fi

echo "✅ Gotowe! Zamknij i otwórz ponownie terminal."
