# Aliases

# Gitself
alias g='git'
compdef g=git

# Managing aliases
# requires an alias `aliases` in `.gitconfig`
alias ga='git aliases'

# Viewing status
alias gst='git status -s -b'
compdef _git gst=git-status

# Staging
alias gad='git add'
compdef _git ga=git-add
alias gap='git add --patch'
compdef _git gap=git-add
alias gau='git rm --cached --'
compdef _git gau=git-rm

# Committing
alias gci='git commit -v'
compdef _git gc=git-commit
alias gca='git commit -v -a'
compdef _git gca=git-commit
alias gcam='git commit -v -a --amend'
compdef _git gcam=git-commit
alias gcu='git reset --soft HEAD^'
compdef _git gcu=git-reset

# Merging
alias gm='git merge --no-ff'
compdef _git gm=git-merge
alias gmff='git merge --ff-only'
compdef _git gmff=git-merge

# Fetching
alias gf='git fetch'
compdef _git gf=git-fetch
alias gft='git fetch --tags'
compdef _git gft=git-fetch
alias gfp='git fetch --prune'
compdef _git gft=git-fetch

# Pushing
alias gp='git push'
compdef _git gp=git-push
alias gpoat='git push origin --all && git push origin --tags'

# Managing branches
alias gb='git branch -v'
compdef _git gb=git-branch
alias gba='git branch -v -a'
compdef _git gba=git-branch
alias gbr='git branch -v -r'
compdef _git gbr=git-branch
alias gbm='git branch -v --merged'
compdef _git gbm=git-branch
alias gbn='git branch -v --no-merged'
compdef _git gbn=git-branch

# Checkout
alias gco='git checkout'
compdef _git gco=git-checkout
alias gcb='git checkout -b'
alias gcm='git checkout master'
alias gcd='git checkout develop'

# Rebasing
# alias grb='git rebase'
# alias grbc='git rebase --continue'
# alias grba='git rebase --abort'
# alias grbs='git rebase --skip'
# alias grbi='git rebase --interactive'

# Resetting
# alias grst='git reset'
# alias grsh='git reset --hard HEAD'
# alias grsm='git reset --merge ORIG_HEAD'
# alias grss='git reset --soft HEAD^'

# Viewing differences
alias gdf='git diff'
gdv() { git diff -w "$@" | view - }
compdef _git gdv=git-diff

# Viewing logs
alias gl='git log'
compdef _git gl=git-log
alias gr='git reflog'
compdef _git gr=git-reflog
alias gll='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --date=relative'
compdef _git gll=git-log
alias glla='git log --all --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --date=relative'
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'

# Managing remote repositories
alias gr='git remote'
compdef _git gr=git-remote
alias grv='git remote -v'
compdef _git grv=git-remote
alias grmv='git remote rename'
compdef _git grmv=git-remote
alias grrm='git remote remove'
compdef _git grrm=git-remote
alias grset='git remote set-url'
compdef _git grset=git-remote
alias grup='git remote update'
compdef _git grset=git-remote

# Managing projects
alias gls='git shortlog -n --no-merges'
alias glss='git shortlog -s -n --no-merges'
alias gcp='git cherry-pick'
compdef _git gcp=git-cherry-pick

# Searching lines
alias ggr='git grep -i -I -n -P'
alias ggri='git grep --cached -i -I -n -P'
alias ggru='git grep --untracked -i -I -n -P'

# Managing submodules
alias gsm='git submodule'


# Will cd into the top of the current repository
# or submodule.
alias grt='cd $(git rev-parse --show-toplevel || echo ".")'

# Git and svn mix
alias git-svn-dcommit-push='git svn dcommit && git push github master:svntrunk'
compdef git-svn-dcommit-push=git

alias gsr='git svn rebase'
alias gsd='git svn dcommit'
#
# Will return the current branch name
# Usage example: git pull origin $(current_branch)
#
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

function current_repository() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo $(git remote -v | cut -d':' -f 2)
}

# these aliases take advantage of the previous function
alias ggpull='git pull origin $(current_branch)'
compdef ggpull=git
alias ggpush='git push origin $(current_branch)'
compdef ggpush=git
alias ggpnp='git pull origin $(current_branch) && git push origin $(current_branch)'
compdef ggpnp=git
