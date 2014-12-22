local return_code="%(?..%{$R%}%? ↵%{$RESET%})"

ranger_prompt_info(){
  if [ -n "$RANGER_LEVEL" ]; then
    echo '(R'"$RANGER_LEVEL"')'
  fi
}

prompt_setup_eckhart(){
  base_prompt="%{$fg[brightwhite]%}$%{$reset_color%} "

  base_prompt_nocolor=$(echo "$base_prompt" | perl -pe "s/%\{[^}]+\}//g")

  add-zsh-hook precmd prompt_eckhart_precmd
}

prompt_eckhart_precmd(){
  local ranger_info='%F{yellow}'$(ranger_prompt_info)'%{%f%}'
  local ranger_info_nocolor=$(echo "$ranger_info" | perl -pe "s/%\{[^}]+\}//g")
  local exp_nocolor="$(print -P \"$base_prompt_nocolor\")"
  local prompt_length=${#exp_nocolor}

  PROMPT="${ranger_info}${base_prompt}"
  RPROMPT="${return_code}"
}

prompt_setup_eckhart
