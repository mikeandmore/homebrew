Homebrew
========
Features and usage of the Mac OS X version are [summarized on the homepage][homepage].

This is an experimental Solaris fork of [Homebrew][homepage].

Quick Install to /usr/local
---------------------------
Use this [script][] to install the Solaris version of 
Homebrew. First you will need [Ruby][ruby] installed, hop on over to sunfreeware or if you are
using 5.11 you can search for the package from Oracle.

    ruby -e "$(curl -fsSL https://raw.github.com/gist/1021141/)"


Dude! Just give me a one-liner!
-------------------------------
Okay then, but please note this installs Homebrew as root and
[we recommend against that][sudo].

    curl -LsSf http://github.com/rmyers/homebrew/tarball/master | sudo /usr/bin/tar xvz -C/usr/local --strip 1



But what packages are available?
--------------------------------
Before installing you can
[browse the Solaris Formula folder on GitHub][browse-formulae].

After installing, you can use `brew search` to find packages or `brew server`
to browse packages off of a local web server.

All the formula in the Solaris folder are know to work, and when you attempt
to install it will also check in the Formula folder and give you a warning
when you are installing. If it works let me know so I can add it to the 
known good packages.

More Documentation
==================
The [wiki][] is your friend.


Who Are You?
============
I'm Robert Myers and I'm a splendid chap as well. My main language of choice
is Python, so forgive me if some things in this fork are wonky.


[homepage]:http://mxcl.github.com/homebrew
[script]:https://gist.github.com/1021141
[gcc]:http://sunfreeware.com/programlistsparc10.html#gcc34
[curl]:http://sunfreeware.com/programlistsparc10.html#curl
[ruby]:http://sunfreeware.com/programlistsparc10.html#ruby
[install]:http://wiki.github.com/mxcl/homebrew/installation
[sudo]:http://wiki.github.com/mxcl/homebrew/installation#sudo
[wiki]:http://wiki.github.com/mxcl/homebrew
[mxcl]:http://twitter.com/mxcl
[browse-formulae]:http://github.com/rmyers/homebrew/tree/master/Library/Solaris/
