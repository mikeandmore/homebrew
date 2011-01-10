require 'formula'

<<-COMMENTS
Versions
--------
This formula is currently tracking version 2.6.x.

Python 3.x is available as a separate formula:
  brew install python3
Python 2.7 is available as:
  brew install python

Options
-------
There are a few options for customzing the build.
  --static:    Builds static instead of shared libraries.

site-packages
-------------
The "site-packages" folder lives in the Cellar, under the "lib" folder.

A .pth file is added to the Cellar site-packages that adds the corresponding
HOMEBREW_PREFIX folder (/usr/local/lib/python2.6/site-packages by default)
to sys.path. Note that this alternate folder doesn't itself support .pth files.

pip / distribute
----------------
The pip (and distribute) formulae in Homebrew are designed only to work
against a Homebrew-installed Python, though they provide links for
manually installing against a custom Python.

pip and distribute are installed directly into the Cellar site-packages,
since they need to install to a place that supports .pth files.

The pip & distribute formuale use the "site_packages" method defined here
to get the appropriate site-packages path.

COMMENTS


class Python26 <Formula
  url 'http://www.python.org/ftp/python/2.6.6/Python-2.6.6.tar.bz2'
  homepage 'http://www.python.org/'
  md5 'cf4e6881bb84a7ce6089e4a307f71f14'
  
  depends_on 'readline' => :optional  # Prefer over OS X's libedit
  depends_on 'sqlite'   => :optional  # Prefer over OS X's older version
  depends_on 'gdbm'     => :optional

  def options
    [
      ["--static", "Build static libraries."]
    ]
  end

  # Skip binaries so modules will load; skip lib because it is mostly Python files
  skip_clean ['bin', 'lib']

  def site_packages
    return lib+"python2.6/site-packages"
  end

  def exec_prefix
    return bin
  end

  def prefix_site_packages
    # The HOMEBREW_PREFIX location of site-packages
    HOMEBREW_PREFIX+"lib/python2.6/site-packages"
  end

  def install

    args = ["--prefix=#{prefix}"]

    args << "--enable-shared" unless ARGV.include? '--static'

    # allow sqlite3 module to load extensions
    inreplace "setup.py",
      'sqlite_defines.append(("SQLITE_OMIT_LOAD_EXTENSION", "1"))',
      '#sqlite_defines.append(("SQLITE_OMIT_LOAD_EXTENSION", "1"))'

    system "./configure", *args
    system "make"
    ENV.j1 # Installs must be serialized
    system "make install"

    # Add the Homebrew prefix path to site-packages via a .pth
    prefix_site_packages.mkpath
    (site_packages+"homebrew.pth").write prefix_site_packages
  end

  def caveats
    site_caveats = <<-EOS.undent
      The site-packages folder for this Python is:
        #{site_packages}

      We've added a "homebrew.pth" file to also include:
        #{prefix_site_packages}

    EOS

    general_caveats = <<-EOS.undent
      You may want to create a "virtual environment" using this Python as a base
      so you can manage multiple independent site-packages. See:
        http://pypi.python.org/pypi/virtualenv

      If you install Python packages via pip, binaries will be installed under
      Python's cellar but not automatically linked into the Homebrew prefix.
      You may want to add Python's bin folder to your PATH as well:
        #{exec_prefix}
    EOS

    s = site_caveats+general_caveats
    return s
  end
end
