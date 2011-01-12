require 'formula'

class Make <Formula
  url 'http://ftp.gnu.org/gnu/make/make-3.82.tar.gz'
  homepage 'http://gcc.gnu.org'
  md5 '7f7c000e3b30c6840f2e9cf86b254fac'


  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make"
    system "make install"
    system "chmod 555 #{prefix}/bin/make"
  end
end
