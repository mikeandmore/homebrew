require 'testing_env'

require 'extend/ARGV' # needs to be after test/unit to avoid conflict with OptionsParser
ARGV.extend(HomebrewArgvExtension)

require 'utils'


class UtilTests < Test::Unit::TestCase

  def test_put_columns_empty
    assert_nothing_raised do
      # Issue #217 put columns with new results fails.
      puts_columns []
    end
  end

  def test_arch_for_command
    arches=archs_for_command '/usr/bin/tar'
    if SUNOS_VERSION == 5.10
      assert_equal 3, arches.length
      assert arches.include?(:x86_64)
    else
      assert_equal 2, arches.length
    end
    assert arches.include?(:i386)
    assert arches.include?(:ppc7400)
  end

end
