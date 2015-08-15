#!/bin/bash
#############################
# Download files config files
#
#############################

# Download oh-my-zsh
if [ ! -d ~/.oh-my-zsh/ ]; then
: <<'END'
    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

# copy old agnoster theme to oh-my-zsh themes
if [ ! -e ~/.oh-my-zsh/themes/agnoster-old.zsh-themes ]; then
    cp agnoster-theme/agnoster-old.zsh-theme ~/.oh-my-zsh/themes/
fi
# Download zsh-syntax-highlight
if [ ! -d ~/.oh-my-zsh/plugins/zsh-syntax-highlighting/ ]; then
    git clone git://github.com/zsh-users/zsh-syntax-highlighting.git \
        ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
fi
END
git clone --recursive https://github.com/sorin-ionescu/prezto.git ~/.zprezto
fi

# Downlaod tmux plugin manager
if [ ! -d ~/.tmux/plugins/tpm/ ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Download and install fzf
if [ ! -d ~/.fzf/ ]; then
    git clone https://github.com/junegunn/fzf.git ~/.fzf
fi

# clone kannan's eclim into eclim folder
dir=~/dotfiles
if [ ! -d ${dir}/eclim ]; then
    git clone https://github.com/itspradeepch/eclim.git ${dir}/eclim
fi
