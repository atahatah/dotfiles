#!/bin/bash

printf "${cyan}Start Darwin specific installation...${reset_color}\n"

########################################
# Homebrew
########################################

if $LOCAL; then
  printf "${yellow}did not install Homebrew because the "-l" option (install locally) was specified.${reset_color}\n"
else
  # install Homebrew
  if type brew > /dev/null; then
    printf "${cyan}Homebrew has already installed.${reset_color}\n"
  else
    printf "${cyan}Installing Homebrew...${reset_color}\n"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    __show_installation_status Homebrew
  fi

  # install all dependencies from the Brewfile with Homebrew
  printf "${cyan}Installing all dependencies from the Brewfile with Homebrew...${reset_color}\n"
  brew bundle --file .Brewfile
  # Homebrew will show installation result
fi

########################################
# VSCode
########################################
printf "${cyan}Installing all extensions to vocode from the vscode-extensions...${reset_color}\n"
# list installed extensions with `code --list-extensions > vscode-extensions`
for extension in $(cat vscode-extensions); do code --install-extension $extension; done
printf "${cyan}Copying vscode settings...${reset_color}\n"
mv ~/Library/Application\ Support/Code/User/settings.json backup/vscode-settings.jsonc
cp vscode-settings.jsonc ~/Library/Application\ Support/Code/User/settings.json

########################################
# font
########################################

if [ -f ~/Library/Fonts/Knack\ Regular\ Nerd\ Font\ Complete.otf ]; then
  printf "${cyan}Font(Knack Nerd Font) has already installed.${reset_color}\n"
else
  printf "${cyan}Downloading Font(Knack Nerd Font)...${reset_color}\n"
  pushd . > /dev/null
  mkdir -p ~/Library/Fonts
  cd ~/Library/Fonts && curl -fLo "Knack Regular Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/0.9.0/patched-fonts/Hack/Regular/complete/Knack%20Regular%20Nerd%20Font%20Complete.ttf
  popd > /dev/null
  __show_installation_status "Font(Knack Nerd Font)"
fi

printf "${green}Finished Darwin specific installation!${reset_color}\n"

########################################
# MacOS settings
########################################

# dock
__dock_item() {
    printf '%s%s%s%s%s' \
           '<dict><key>tile-data</key><dict><key>file-data</key><dict>' \
           '<key>_CFURLString</key><string>' \
           "$1" \
           '</string><key>_CFURLStringType</key><integer>0</integer>' \
           '</dict></dict></dict>'
}

defaults write com.apple.dock \
               persistent-apps -array "$(__dock_item /System/Applications/Launchpad.app)" \
                                      "$(__dock_item /Applications/Google\ Chrome.app)" \
                                      "$(__dock_item /Applications/Slack.app)" \
                                      "$(__dock_item /System/Applications/Utilities/Terminal.app)" \
                                      "$(__dock_item /System/Applications/System\ Settings.app)" \
                                      "$(__dock_item /Applications/Visual\ Studio\ Code.app)"

defaults write com.apple.dock tilesize -int 64
defaults write com.apple.dock autohide -bool true

killall Dock

# disable showing char when holding one key
defaults write -g ApplePressAndHoldEnabled -bool false
