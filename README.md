This is the repository for my dotfiles, which I manage using Git and GNU Stow.

1. **Clone the repository**

   ```sh
   git clone https://github.com/thomasgordon/dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```

2. **Install Required Tools and Plugins**

    **Oh My Zsh**
    ```sh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    ```

    **PowerLevel10k Theme**
   ```sh
   brew install powerlevel10k
   echo "source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc
   ```

   **Zsh Plugins**

   ```sh
   git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
   git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
   git clone https://github.com/Aloxaf/fzf-tab.git $ZSH_CUSTOM/plugins/fzf-tab
   git clone https://github.com/rupa/z.git $ZSH_CUSTOM/plugins/z
   ```

   **FZF**

   ```sh
   brew install fzf
   ```

3. **Use Stow To Create Symbolic Links**

    ```sh
    stow .
    ```
