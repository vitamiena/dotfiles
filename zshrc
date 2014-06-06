#----------------------------------------------------------------
#一般設定
#----------------------------------------------------------------

#文字コード
export LANG=ja_JP.UTF-8
export TERM='xterm-256color'
#色を使用可能にする
autoload -Uz colors
#キーバインドをEmacsモード
bindkey -e

#----------------------------------------------------------------
#オプション
#----------------------------------------------------------------

#ビープ音なし
setopt no_beep
# '#' 以降をコメントとして扱う
setopt interactive_comments
# 出力の文字列末尾に改行コードが無い場合でも表示
unsetopt promptcr
# コマンドのスペルを訂正
setopt correct
# ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する
setopt mark_dirs
# 最後のスラッシュを自動的に削除しない
unsetopt auto_remove_slash

#TeraTermの操作ロック無効
stty stop undef

#-------------------------------------------------------------------
#補完
#-------------------------------------------------------------------

#補完候補が複数ある時に自動的に一覧表示する
setopt auto_menu
#補完機能一覧でファイルの種別をマーク表示
setopt list_types
#補完候補を一覧表示
setopt auto_list
# 補完候補をグループ別に表示する
zstyle ':completion:*' menu select
zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*' group-name 
#コマンドに対する補完機能
autoload -U compinit
compinit
#補完時にスペルチェック
#setopt auto_correct
# 自動修正
setopt correct
setopt correct_all
# 補完時にヒストリを自動的に展開する
setopt hist_expand
# 補完キー（Tab, Ctrl+I) を連打するだけで順に補完候補を自動で補完
setopt auto_menu
# 補完結果をできるだけ詰める
setopt list_packed
# カッコの対応などを自動的に補完
setopt auto_param_keys
# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash
# 補完の時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 補完候補表示時にビープ音を鳴らさない
setopt nolistbeep
# 出力の文字列末尾に改行コードが無い場合でも表示
unsetopt promptcr
# sudo, manなどの後でコマンドを補完する
compctl -l '' nohup exec nice eval time sudo man

#-------------------------------------------------------------------
# history
#-------------------------------------------------------------------

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
# 重複したコマンドラインはヒストリに追加しない
#setopt hist_ignore_dups
# 履歴の共有
setopt share_history
# ヒストリにhistoryコマンドを記録しない
setopt hist_no_store
# 余分なスペースを削除してヒストリに記録する
setopt hist_reduce_blanks
# 履歴ファイルに時刻を記録
setopt extended_history
# ヒストリファイルに保存するとき、すでに重複したコマンドがあったら古い方を削除する
#setopt hist_save_nodups


#-------------------------------------------------------------------
# プロンプト設定
#-------------------------------------------------------------------

# 色設定
autoload -U colors; colors
# もしかして機能
setopt correct
# PCRE 互換の正規表現を使う
setopt re_match_pcre

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

# プロンプト指定
PROMPT="
[%n@%m] 
%(?.%{$fg[green]%}.%{$fg[green]%})%(?!---->!---->)%{${reset_color}%} "

RPROMPT="%{${fg[yellow]}%}[%30<....<%~]%{${reset_color}%}"
# プロンプト指定(コマンドの続き)
PROMPT2='[%n]> '
# もしかして時のプロンプト指定
SPROMPT="%{$fg[red]%}%{$suggest%}----> もしかして %B%r%b %{$fg[red]%} [そう!(y), 違う!(n),a,e]:${reset_color} "

#----------------------------------------------------
# alias
#----------------------------------------------------

alias dt='echo 乙'
alias e='emacs'
alias gb='echo goodbye! ; sleep 1 ; logout'
alias ls='ls --color=auto -F'
alias rm='rm -i'
alias la='ls -a'
alias ll='ls -l'
alias df='df -h'

#----------------------------------------------------
# PATH
#----------------------------------------------------

export PATH="${HOME}/.cask/bin:$PATH"
