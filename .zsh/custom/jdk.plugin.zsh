function setjdk() {
  if [ $# -ne 0 ]; then
    removeFromPath '/usr/lib/jvm/default/bin'
    if [ -n "${JAVA_HOME+x}" ]; then
      removeFromPath $JAVA_HOME
    fi
    export JAVA_HOME="/usr/lib/jvm/$@"
    export PATH=$JAVA_HOME/bin:$PATH

    java -version
  else
    echo "Available versions:"
    ls /usr/lib/jvm
  fi
}
function removeFromPath() {
  export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
}

# setjdk "1.7.0_80"
# setjdk "1.8.0_51"
