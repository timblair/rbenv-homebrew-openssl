# DEPRECATION NOTICE

Note: This plugin is no longer necessary. rbenv already uses openssl from
Homebrew _if_ it considers your openssl version ["broken"](https://github.com/rbenv/ruby-build/blob/4dac7b1b34479f001b85b8895748170886906c2c/bin/ruby-build#L986-L992).

To force a specific version of openssl, set `RUBY_CONFIGURE_OPTS` like this:

```
$ export RUBY_CONFIGURE_OPTS=--with-openssl-dir=$(brew --prefix openssl@1.1)
$ rbenv install 2.5.1
```

You might want to set this environment variable in your `~/.bash_profile`.

## Check what openssl version is linked

```
$ ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'
OpenSSL 1.1.0h  27 Mar 2018
```

## License

This plugin is released under the MIT license. Please see the LICENSE file.
