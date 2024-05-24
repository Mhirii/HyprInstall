#!/bin/bash

repo_name=dotfiles
dotfiles_repo="https://github.com/Mhirii/$repo_name"
dotfiles="$HOME/repos/$repo_name/dot_config"

echo install

# hypr
paru -S hyprland-git hyprlang hyprprop-git hyprshot hyprlock-git hyprpicker-git new-displays xdg-desktop-portal-hyprland-git --needed

# others
paru -S alacritty keyd rofi-lbonn-wayland swaync waybar mako yazi --needed

# dev
paru -S docker visual-studio-code-bin \
	lazygit lazydocker \
	nodejs-lts-hydrogen pnpm \
	go air-bin \
	curl httpie curlie \
	-needed

sudo groupadd docker
sudo usermod -aG docker "$USER"

# bun
curl -fsSL https://bun.sh/install | bash

mkdir "$HOME/repos"
git clone $dotfiles_repo "$HOME/repos/$repo_name" || exit

echo Applying configs

echo Applying fish configs
cp -r "$dotfiles/fish" "$HOME/.config/fish"

echo Applying starship configs
cp "$dotfiles/starship" "$HOME/.config/"

echo Applying alacritty configs
cp -r "$dotfiles/alacritty" "$HOME/.config/alacritty"

echo Applying alacritty configs
cp -r "$dotfiles/alacritty" "$HOME/.config/alacritty"

echo Applying kitty configs
cp -r "$dotfiles/kitty" "$HOME/.config/kitty"

echo Applying rofi configs
cp -r "$dotfiles/rofi" "$HOME/.config/rofi"

echo Applying waybar configs
cp -r "$dotfiles/waybar" "$HOME/.config/waybar"

echo Applying hypr configs
cp -r "$dotfiles/hypr" "$HOME/.config/hypr"

echo All configs copied
