# Sane dircolors
export LS_COLORS='di=1;34:ln=35:so=32:pi=0;33:ex=32:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=1;34:ow=1;34:'

local return_code="%(?..%{$R%}%? ↵%{$RESET%})"

prompt_setup_pygmalion(){
  base_prompt="%{$fg[black]%}────%{$reset_color%}  "

  base_prompt_nocolor=$(echo "$base_prompt" | perl -pe "s/%\{[^}]+\}//g")

  add-zsh-hook precmd prompt_pygmalion_precmd
}

prompt_pygmalion_precmd(){
  local exp_nocolor="$(print -P \"$base_prompt_nocolor\")"
  local prompt_length=${#exp_nocolor}

  PROMPT="$base_prompt"
  RPROMPT="${return_code}"
}

prompt_setup_pygmalion
