# rbenv-homebrew-openssl

This rbenv plugin hooks into the `rbenv install` command to automatically set
the appropriate configuration flags to build against OpenSSL from Homebrew (if
both are installed).

## Installation

Make sure you have the latest rbenv and ruby-build versions, then run:

```sh
git clone https://github.com/timblair/rbenv-homebrew-openssl.git ~/.rbenv/plugins/rbenv-homebrew-openssl
```

## Usage

rbenv-homebrew-openssl will automatically build any Rubies against the Homebrew
version of OpenSSL and, because it does so via the `CONFIGURE_OPTS` environment
variable, will also pass along the appropriate `CPPFLAGS` and `LDFLAGS` values
to any `./configure` invocations, including Gem installations with native
extensions.

## Why?

OS X 10.11 (El Capitan) no longer ships with a linkable version of OpenSSL, so
any built Rubies won't have SSL support compiled in.  The version of OpenSSL
from Homebrew is keg-only, and while you _can_ force it to link, it's probably
wise not to.

You can install individial Rubies by specifying where OpenSSL is using the
`RUBY_CONFIGURE_OPTS` environment variable:

```sh
RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)" rbenv install $RB_VERSION
```

There are two problems with this:

1. You need to specify every time you need to install a new Ruby.
2. You also need to specify similar every time you install a gem that needs
   to link against OpenSSL (e.g. Event Machine or Puma).

You can get around the second issue by instead using the `CONFIGURE_OPTS` var;
the values from here get written in to `RbConfig` at compile-time, and will
then be passed on to anything that uses `./configure`, such as gems with native
elements:

```sh
CONFIGURE_OPTS="CPPFLAGS=$(brew --prefix openssl)/lib LDFLAGS=$(brew --prefix openssl)/include"
```

Now we can do that, this plugin is to get around the first issue listed above.
Install the plugin, and then you don't need to remember the magic incantation
every time you install a new Ruby.

## License

This plugin is released under the MIT license. Please see the LICENSE file.
