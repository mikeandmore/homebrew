Homebrew
========
Features and usage of the Mac OS X version are [summarized on the homepage][homepage].

This is an experimental Solaris fork of [Homebrew][homepage].

Quick Install to /usr/local
---------------------------
Installation is slightly more tricky on Solaris. So there is no quick installer
at the moment. Currently there are a few dependencies you'll need to get first.

These are on sunfreeware.com and install in /usr/local

* [GCC][gcc]
* [Curl][curl]
* [Ruby][ruby]


Dude! Just give me a one-liner!
-------------------------------
Okay then, but please note this installs Homebrew as root and
[we recommend against that][sudo].

    curl -LsSf http://github.com/rmyers/homebrew/tarball/master | sudo /usr/bin/tar xvz -C/usr/local --strip 1


But what packages are available?
--------------------------------
Before installing you can
[browse the Formula folder on GitHub][browse-formulae].

After installing, you can use `brew search` to find packages or `brew server`
to browse packages off of a local web server.

Warning not all the formula has been tested on Solaris, but we're working on that.

More Documentation
==================
The [wiki][] is your friend.


Who Are You?
============
I'm Robert Myers and I'm a splendid chap.


[homepage]:http://mxcl.github.com/homebrew
[gcc]:http://sunfreeware.com/programlistsparc10.html#gcc34
[curl]:http://sunfreeware.com/programlistsparc10.html#curl
[ruby]:http://sunfreeware.com/programlistsparc10.html#ruby
[install]:http://wiki.github.com/mxcl/homebrew/installation
[sudo]:http://wiki.github.com/mxcl/homebrew/installation#sudo
[wiki]:http://wiki.github.com/mxcl/homebrew
[mxcl]:http://twitter.com/mxcl
[browse-formulae]:http://github.com/rmyers/homebrew/tree/master/Library/Formula/
