#%5d%
#%c%
PROMPT="%(?:%{$fg_bold[green]%}%1{➜%} :%{$fg_bold[red]%}%1{➜%} ) %{$fg[cyan]%}%2d%{$reset_color%} "

PROMPT+='$(git_prompt_info)'

RPROMPT='$(
  ctx=$(grep current-context ~/.kube/config 2>/dev/null | cut -d" " -f2)
  env=$(echo "$PWD" | grep -oE "dev|qa|preprod|prod")

  case $ctx in
    *dev*)     color="%F{green}"   label="dev" ;;
    *qa*)      color="%F{yellow}"  label="qa" ;;
    *preprod*) color="%F{magenta}" label="preprod" ;;
    *prod*)    color="%F{red}"     label="prod" ;;
    *dds-internal-tools*) color="%F{245}" label="dds-internal-tools" ;;
    *)         color="%F{245}" label="notfound" ;;
  esac

  # se env Ôö£┬┐ vuoto, non mostra nulla
  if [[ -n "$env" ]]; then
    echo "${color}\u2388 ${label} ($env)%f"
  else
    echo "${color}\u2388 ${label}%f"
  fi
)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{├ö┬ú├╣%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
