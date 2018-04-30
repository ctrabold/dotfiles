if [[ $OSTYPE == darwin* ]]; then
  export JAVA_HOME=$(/usr/libexec/java_home);
else
  export JAVA_HOME="/usr/bin/java";
fi

export PATH="$HOME/.jenv/bin:$PATH"
