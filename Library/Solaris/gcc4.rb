require 'formula'

class Gcc4 < Formula
  homepage 'http://gcc.gnu.org'
  url 'http://ftpmirror.gnu.org/gcc/gcc-4.5.3/gcc-4.5.3.tar.bz2'
  version '4.5.3'
  md5 '8e0b5c12212e185f3e4383106bfa9cc6'

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--mandir=#{man}",
                          "--infodir=#{info}",
                          "--enable-shared"
    system "make install"
  end
end
