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
