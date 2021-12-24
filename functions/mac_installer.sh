brew_apps=(
  "mas"
  "git"
  "tmux"
  "powerlevel10k"
  "zsh-autosuggestions"
  "zsh-syntax-highlighting"
  "z"
  "lsd"
)
cask_apps=(
  "google-chrome"
  "iterm2"
  "notion"
  "postman"
  "slack"
  "font-hack-nerd-font"
  "topnotch"
)
mas_apps=(
  "KakaoTalk"
)

 # install oh-my-zsh
 if [[ -f "~/..zshrc" ]]; then
  echo "<ohmyzsh> \033[31;1m"Start Install..."\033[m"
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  echo "<ohmyzsh> \033[32;1m"Install Finish!!"\033[m"
 fi

 function install_app() {
   option=$2
   name=$1[@]
   arr=${!name}
   for app in ${arr[@]}; do
     if ! brew list ${option} ${app} &> /dev/null; then
      echo "<$app> \033[31;1m"Start Install..."\033[m"
      if "font-hack-nerd-font" == ${app}; then
        brew tap homebrew/cask-fonts
      fi
      brew install ${option} ${app}
      echo "<$app> \033[32;1m"Install Finish!!"\033[m"
    else
      echo "<$app> \033[32;1m"Already Installed!!"\033[m"
    fi
  done
}

function install_mas_app() {
  for app in ${mas_apps[@]}; do
    if ! mas list | grep ${app} &> /dev/null; then
      echo "<$app> \033[31;1m"Start Install..."\033[m"
      mas search "${app}" | sed -n '/${app}/p' | sed -nr 's/ ${app}.+//p' | xargs -I{} mas install {}
      echo "<$app> \033[32;1m"Install Finish!!"\033[m"
    else
      echo "<$app> \033[32;1m"Already Installed!!"\033[m"
    fi
  done
}

install_app brew_apps
install_app cask_apps "--cask"
install_mas_app

cp -r ../nvim ~/.config/
cp -r ../tmux ~/.config/
cp ../shell/.zshrc ~
