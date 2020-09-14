source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/plug-config/quickscope.vim

if exists('g:vscode')
  " VS Code extension
  source $HOME/.config/nvim/vscode/settings.vim
else
  source $HOME/.config/nvim/plug-config/fzf.vim
  source $HOME/.config/nvim/plug-config/floaterm.vim
  source $HOME/.config/nvim/plug-config/rnvimr.vim
  source $HOME/.config/nvim/plug-config/go.vim
  source $HOME/.config/nvim/plug-config/coc.vim
  source $HOME/.config/nvim/plug-config/ultisnips.vim
  source $HOME/.config/nvim/keys/which-key.vim
  source $HOME/.config/nvim/themes/airline.vim
  "source $HOME/.config/nvim/lua/plug-colorizer.lua
endif 
