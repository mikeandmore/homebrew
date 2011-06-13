require 'extend/pathname'
require 'extend/ARGV'
require 'extend/string'
require 'utils'
require 'exceptions'
require 'compatibility'

ARGV.extend(HomebrewArgvExtension)

HOMEBREW_VERSION = '0.8'
HOMEBREW_WWW = 'http://rmyers.github.com/homebrew/'

HOMEBREW_CACHE = Pathname.new("/tmp/homebrew_cache")

# Where brews installed via URL are cached
HOMEBREW_CACHE_FORMULA = HOMEBREW_CACHE+"Formula"

if not defined? HOMEBREW_BREW_FILE
  HOMEBREW_BREW_FILE = ENV['HOMEBREW_BREW_FILE'] || `which brew`.chomp
end

HOMEBREW_PREFIX = Pathname.new(HOMEBREW_BREW_FILE).dirname.parent # Where we link under
HOMEBREW_REPOSITORY = Pathname.new(HOMEBREW_BREW_FILE).realpath.dirname.parent # Where .git is found

# Where we store built products; /usr/local/Cellar if it exists,
# otherwise a Cellar relative to the Repository.
HOMEBREW_CELLAR = if (HOMEBREW_PREFIX+"Cellar").exist?
  HOMEBREW_PREFIX+"Cellar"
else
  HOMEBREW_REPOSITORY+"Cellar"
end

# Just for some formula
MACOS_VERSION = 10.4
SUNOS_FULL_VERSION = `uname -imprs`.chomp
SUNOS_VERSION = `uname -r`.chomp.to_f
SUNOS_MAJOR, SUNOS_MINOR = `uname -r`.chomp.split('.')

HOMEBREW_USER_AGENT = "Homebrew #{HOMEBREW_VERSION} (Ruby #{RUBY_VERSION}-#{RUBY_PATCHLEVEL}; SunOS #{SUNOS_FULL_VERSION})"


RECOMMENDED_LLVM = 2326
RECOMMENDED_GCC_40 = 5493
RECOMMENDED_GCC_42 = 5577


require 'fileutils'
module Homebrew extend self
  include FileUtils
end

FORMULA_META_FILES = %w[README README.md ChangeLog COPYING LICENSE LICENCE COPYRIGHT AUTHORS]
PLEASE_REPORT_BUG = "#{Tty.white}Please report this bug: #{Tty.em}https://github.com/rmyers/homebrew/wiki/new-issue#{Tty.reset}"
