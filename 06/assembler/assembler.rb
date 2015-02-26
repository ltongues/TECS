class Parser
end

module Code
  dest_map = {
    'null': '000',
    'M'   : '001',
    'D'   : '010',
    'MD'  : '011',
    'A'   : '100',
    'AM'  : '101',
    'AD'  : '110',
    'AMD' : '111'
  }

  jump_map = {
    'null': '000',
    'JGT' : '001',
    'JEQ' : '010',
    'JGE' : '011',
    'JLT' : '100',
    'JNE' : '101',
    'JLE' : '110',
    'JMP' : '111'
  }

  comp_map = {
    # a bit is 0
    '0'  : '0101010',
    '1'  : '0111111',
    '-1' : '0111010',
    'D'  : '0001100',
    'A'  : '0110000',
    '!D' : '0001101',
    '!A' : '0110001',
    '-D' : '0001111',
    '-A' : '0110011',
    'D+1': '0011111',
    'A+1': '0110111',
    'D-1': '0001110',
    'A-1': '0110010',
    'D+A': '0000010',
    'D-A': '0010011',
    'A-D': '0000111',
    'D&A': '0000000',
    'D|A': '0010101',

    # a bit is 1
    'M'  : '1110000',
    '!M' : '1110001',
    '-M' : '1110011',
    'M+1': '1110111',
    'M-1': '1110010',
    'D+M': '1000010',
    'D-M': '1010011',
    'M-D': '1000111',
    'D&M': '1000000',
    'D|M': '1010101'
  }

  def dest(mnemonic)
    dest_map[mnemonic]
  end

  def jump(mnemonic)
    jump_map[mnemonic]
  end

  def comp(mnemonic)
    comp_map[mnemonic]
  end
end

asm_lines = File.readlines(ARGV[0])
hack_lines = asm_lines
fname, _fext = ARGV[0].split('.')

File.open("#{fname}.hack", 'w') do |f|
  hack_lines.each do |line|
    f.puts(line)
  end
end
