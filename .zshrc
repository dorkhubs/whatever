export ZSH="$HOME/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh
export ARCHFLAGS="-arch x86_64"

unset items
foreach items in /main/source-docs/*; do
   source $items
done

if [ -e "$HOME/.zshrc.pre-oh-my-zsh" ]; then
   mv $HOME/.zshrc.pre-oh-my-zsh $HOME/.zshrc
   source $theme
fi


