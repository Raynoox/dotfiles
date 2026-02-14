#!/bin/bash
echo "🚀 Rozpoczynam automatyczną instalację środowiska..."

echo "📦 Instalacja pakietów systemowych..."
sudo apt update && sudo apt install -y zsh git curl ripgrep fd-find build-essential unzip

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

echo "✅ Gotowe! Zamknij i otwórz ponownie terminal."
