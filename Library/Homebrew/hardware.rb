class Hardware
  # These methods use info spewed out by sysctl.
  # Look in <mach/machine.h> for decoding info.

  def self.cpu_type
    @@cpu_type ||= `/usr/bin/uname -p`
  end

  def self.intel_family
    @@intel_family ||= '999999999'

    case @@intel_family
    when 0x73d67300 # Yonah: Core Solo/Duo
      :core
    when 0x426f69ef # Merom: Core 2 Duo
      :core2
    when 0x78ea4fbc # Penryn
      :penryn
    when 0x6b5a4cd2 # Nehalem
      :nehalem
    when 0x573B5EEC # Arrandale
      :arrandale
    else
      :dunno
    end
  end

  def self.processor_count
    @@processor_count ||= `/usr/sbin/psrinfo |tail -1`.chomp.to_i + 1
  end
  
  def self.cores_as_words
    case Hardware.processor_count
    when 1 then 'single'
    when 2 then 'dual'
    when 4 then 'quad'
    else
      Hardware.processor_count
    end
  end

  def self.is_32_bit?
    not self.is_64_bit?
  end

  def self.is_64_bit?
    self.bits == 64
  end
  
  def self.bits
    @@bits ||= `/usr/bin/isainfo -kv`.chomp.to_i
  end

end

def snow_leopard_64?
  return false
end

