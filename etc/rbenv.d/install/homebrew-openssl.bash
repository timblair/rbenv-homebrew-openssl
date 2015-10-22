set_openssl_env() {
  if $(hash brew 2>/dev/null && brew ls openssl 2>/dev/null); then
    p=$(brew --prefix openssl)
    echo "Using OpenSSL from Homebrew at $p"
    export CONFIGURE_OPTS="CPPFLAGS=-I$p/include LDFLAGS=-L$p/lib $CONFIGURE_OPTS"
  fi
}

before_install set_openssl_env
