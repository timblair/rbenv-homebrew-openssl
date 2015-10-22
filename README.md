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

## License

This plugin is released under the MIT license. Please see the LICENSE file.
