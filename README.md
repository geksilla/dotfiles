# Dotfiles [WIP]

## Installation

### Shell

Install [zsh](http://www.zsh.org/)

*Ubuntu/Debian*

```
$ sudo apt-get install zsh && sudo chsh -s /bin/zsh
```

*Mac*

```
$ brew install zsh zsh-completions
```
    
Install [zgen](https://github.com/tarjoilija/zgen)

```
$ mkdir -p ~/scripts; git clone https://github.com/tarjoilija/zgen ~/scripts/zgen
```

Install ~zsh~ dotfile.

```
$ ln -s ~/dotfile/zshrc ~/.zshrc
```

Relogin from the terminal

### Tmux

Install [tmux](https://tmux.github.io/)

*Mac*

```
$ brew install tmux
```

*Ubuntu/Debian*

```
$ sudo apt-get install tmux
```


Install [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)

```
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Install ~tmux~ dotfile.

```
$ ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
```

### Emacs

Install latest emacs.

*Ubuntu/Debian*

Install latest emacs. I'm using emacs-snapshot. To install emacs-snapshot:

```
sudo add-apt-repository -y ppa:ubuntu-elisp
sudo apt-get update
sudo apt-get install emacs-snapshot
sudo update-alternatives --set emacs /usr/bin/emacs-snapshot
```

Or using linuxbrew:

```
export PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig:/usr/lib/pkgconfig:/usr/share/pkgconfig:$PKG_CONFIG_PATH
brew reinstall --HEAD --with-glib --with-x11 --env=inherit emacs
```

Install [spacemacs](https://github.com/syl20bnr/spacemacs).

```
$ git clone --recursive https://github.com/syl20bnr/spacemacs ~/.emacs.d
```

Install ~spacemacs~ dotfile.

```
$ ln -s ~/dotfiles/spacemacs/spacemacs ~/.spacemacs
```

Start Emacs.

**Note:**

[Magit package](https://github.com/magit/magit) works properly with Git 2.x.

### Vim

Install latest vim

```
$ brew install --with-lua --with-luajit --with-python vim
```

Install [vim-plug](https://github.com/junegunn/vim-plug)

```
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

On first launch

```
$ ln -s ~/dotfiles/vimrc ~/.vimrc
$ vim -c "PlugInstall | q"
```

And vim is ready!

## Tools

* [Homebrew Linux](https://github.com/Homebrew/linuxbrew)

```
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/linuxbrew/go/install)"
```

* [peco](https://github.com/peco/peco)

```
$ brew tap peco/peco && brew install peco
```

* [fzf](https://github.com/junegunn/fzf)

```
$ git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
```
*NOTE*: During fzf installation prompt decline auto-completion support, since it breaks
autosuggestions.

* [pygments](http://pygments.org/)
oh-my-zsh *colorize* plugin uses pygments to colorize output.

```
$ pip install pygments
```

### Node/javascript

* [nvm](https://github.com/creationix/nvm)

```
$ curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.25.4/install.sh | bash
```

* [tern](http://ternjs.net/)

```
npm i -g tern
```
