#%5d%
#%c%
PROMPT="%(?:%{$fg_bold[green]%}%1{➜%} :%{$fg_bold[red]%}%1{➜%} ) %{$fg[cyan]%}%c%{$reset_color%} \$(echo \$PWD | grep -oE 'dev|qa|preprod|prod') "

PROMPT+='$(git_prompt_info)'

#RPROMPT='$(grep current-context ~/.kube/config | cut -d" " -f2)'
RPROMPT='$(ctx=$(grep current-context ~/.kube/config | cut -d" " -f2); 
if [[ $ctx == *dev* ]]; then echo "%F{green}\u2388 dev%f"; 
elif [[ $ctx == *qa* ]]; then echo "%F{yellow}\u2388 qa%f"; 
elif [[ $ctx == *prod* && $ctx != *preprod* ]]; then echo "%{$fg_bold[red]%}\u2388 prod%f"; 
elif [[ $ctx == *preprod* ]]; then echo "%F{magenta}\u2388 preprod%f"; 
elif [[ $ctx == *dds-internal-tools* ]]; then echo "%F{245}\u2388 dds-internal-tools%f";
else echo "%F{245}\u2388 notfound%f"; fi)'


ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{Ô£ù%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
