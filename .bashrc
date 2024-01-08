GREEN='\[\e[0;32m\]'
LIGHT_BLUE='\[\e[0;96m\]'
NC='\[\e[0m\]'

find_git_branch () {
  local branch=$(git branch 2>/dev/null | grep \* | cut -d " " -f 2)
  if [[ "$branch" != "" ]]; then
    git_branch="($branch)"
  else
    git_branch=""
  fi
}


find_git_branch_dirty () {
  local status=$(git status --porcelain 2>/dev/null)

  if [[ "$status" != "" ]]; then
    dirty='*'
  else
    dirty=''
  fi
}

PROMPT_COMMAND="find_git_branch; find_git_branch_dirty;"
export PS1="\n${YELLOW}\t ${NC}\w${GREEN} \$git_branch\$dirty\n${LIGHT_BLUE}> ${NC}"

