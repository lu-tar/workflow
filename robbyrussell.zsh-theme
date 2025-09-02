PROMPT="%(?:%{$fg_bold[green]%}%1{Ô×£%} :%{$fg_bold[red]%}%1{Ô×£%} ) %{$fg[cyan]%}%5d%{$reset_color%}"
PROMPT+=' $(git_prompt_info)'

#RPROMPT='$(grep current-context ~/.kube/config | cut -d" " -f2)'
RPROMPT='$(ctx=$(grep current-context ~/.kube/config | cut -d" " -f2); 
if [[ $ctx == *dev* ]]; then echo "%F{green}ÔÄê dev%f"; 
elif [[ $ctx == *qa* ]]; then echo "%F{yellow}ÔÄê qa%f"; 
elif [[ $ctx == *prod* && $ctx != *preprod* ]]; then echo "%{$fg_bold[red]%}ÔÄê prod%f"; 
elif [[ $ctx == *preprod* ]]; then echo "%F{magenta}ÔÄê preprod%f"; 
elif [[ $ctx == *dds-internal-tools* ]]; then echo "%F{245}ÔÄê dds-internal-tools%f";
else echo "%F{245}ÔÄê notfound%f"; fi)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{Ô£ù%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
