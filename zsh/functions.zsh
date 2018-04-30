## Print a horizontal rule
rule () {
  printf "%$(tput cols)s\n"|tr " " "─"}}
