require 'formula'

class Readline2 < Formula
  homepage 'http://tiswww.case.edu/php/chet/readline/rltop.html'
  url 'ftp://ftp.cwru.edu/pub/bash/readline-6.2.tar.gz'
  sha256 '79a696070a058c233c72dd6ac697021cc64abd5ed51e59db867d66d196a89381'
  version '6.2.1'

  def patches
    {:p0 => [
        "ftp://ftp.cwru.edu/pub/bash/readline-6.2-patches/readline62-001",
      ]}
  end

  def install
    # Always build universal, per https://github.com/mxcl/homebrew/issues/issue/899
    ENV.universal_binary
    # Fix darwin detection for Lion, see https://github.com/mxcl/homebrew/issues/4782
    inreplace 'support/shobj-conf', 'darwin[89]*|darwin10*)', 'darwin[89]*|darwin1[01]*)'
    system "./configure", "--prefix=#{prefix}",
                          "--mandir=#{man}",
                          "--infodir=#{info}",
                          "--enable-multibyte"
    system "make install"
  end
end
