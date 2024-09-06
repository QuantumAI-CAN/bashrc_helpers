# "Colorize" the plain text.
#
# Usage:
#
#   $ colorize "TEXT" COLOR ["STYLE"] [BACKGROUND]
#
# Notes:
#   - STYLE may be either a single value or a space-delimited string
#
# Examples:
#
#   $ colorize "Hey!" blue bold
#   $ colorize "Yo!" red italic white
#
colorize() {
  text="$1"

  if [ "$color_support" = true ]
  then
    color="$2"
    style=($3)
    background="$4"
    colors=(black red green yellow blue purple cyan white)
    styles=(regular bold italic underline reverse)
    sn=(0 1 3 4 7)

    for n in {0..7}
    do
      [[ $color == ${colors[n]} ]] && color="3$n"
      [[ $background == ${colors[n]} ]] && background="4$n"
      for s in ${!style[@]}
      do
        [[ ${style[s]} == ${styles[n]} ]] && style[s]="${sn[n]}"
      done
    done

    ! [ -z $style ] && style="${style[*]};" && style=${style// /;}
    ! [ -z $background ] && background=";$background"
    background+="m"

    text="\e[$style$color$background$text\e[0m"
  fi

  echo "$text"
}

colorize_prompt() {
  colorize $@ &>/dev/null

  if [ "$color_support" = true ]
  then
    text="\[\e[$style$color$background\]$1\[\e[0m\]"
  fi

  echo $text
}

color_support='true'
#Mac IP address
ipadd=$(ifconfig en0 |grep 'inet' |grep -v inet6 |awk '{print $2}')

#ipadd=$(ifconfig ens192 |grep 'inet addr' |awk '{print $2}' | awk -F':' '{print $2}')
#ipadd=$(ifconfig eth2 |grep 'inet addr' |awk '{print $2}' | awk -F':' '{print $2}')
#ipadd=$(ifconfig eth1 |grep inet |grep -v inet6|awk '{print $2}')
# Main prompt
#PS1="$(colorize_prompt "[" yellow bold) $(colorize_prompt "\u" purple bold) $(colorize_prompt "on" yellow bold) $(colorize_prompt "\h" yellow bold) $(colorize_prompt "\d" purple bold) $(colorize_prompt "\T" purple bold) $(colorize_prompt "]" yellow bold)\n$(colorize_prompt "[" yellow bold) $(colorize_prompt "\u" green bold)$(colorize_prompt "@" purple bold)$(colorize_prompt "$ipadd:" cyan bold)$(colorize_prompt "\w" green bold) $(colorize_prompt "]" yellow bold)# "

PS1="$(colorize_prompt "[" yellow bold) $(colorize_prompt "\u" purple bold) $(colorize_prompt "on" yellow bold) $(colorize_prompt "\h" yellow bold) $(colorize_prompt "\d" purple bold) $(colorize_prompt "\T" purple bold) $(colorize_prompt "]" yellow bold)\n$(colorize_prompt "[" yellow bold) $(colorize_prompt "\u" green bold) $(colorize_prompt "@" purple bold) $(colorize_prompt "${ipadd}:" cyan bold) $(colorize_prompt "\w" green bold) $(colorize_prompt "]" yellow bold)# "


# Continuation prompt
PS2="$(colorize_prompt "|" cyan bold) "

