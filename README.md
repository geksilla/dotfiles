# Dotfiles

## Installation

### Shell

Install [zsh](http://www.zsh.org/)

*Ubuntu/Debian*

    $ sudo apt-get install zsh && sudo chsh -s /bin/zsh 

*Mac*

    $ brew install zsh zsh-completions
    
Install [zgen](https://github.com/tarjoilija/zgen)

    $ mkdir -p ~/scripts; git clone https://github.com/tarjoilija/zgen ~/scripts/zgen

Relogin from the terminal


### Emacs

Install latest emacs.

Install [spacemacs](https://github.com/syl20bnr/spacemacs).

    $ git clone --recursive https://github.com/syl20bnr/spacemacs ~/.emacs.d

### Vim

Install latest vim

    $ brew install --with-lua --with-luajit --with-python vim

Install [vim-plug](https://github.com/junegunn/vim-plug)

    $ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

On first launch

    $ vim -c "PlugInstall | q"

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
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
```
*NOTE*: During fzf installation prompt decline auto-completion support, since it breaks
autosuggestions.

### Node/javascript

* [nvm](https://github.com/creationix/nvm)

```
$ curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.25.4/install.sh | bash
```

* [tern](http://ternjs.net/)

```
npm i -g tern
```
