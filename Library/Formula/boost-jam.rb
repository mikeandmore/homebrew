require 'formula'

class BoostJam < Formula
  url 'http://downloads.sourceforge.net/project/boost/boost-jam/3.1.18/boost-jam-3.1.18.tgz'
  homepage 'http://www.boost.org/doc/tools/build/doc/html/jam/usage.html'
  md5 'f790e022d658db38db5cc4aeeccad3f1'

  def install
    system "./build.sh"
    bin.install Dir["bin.SUNOS*/bjam"]
  end
end
