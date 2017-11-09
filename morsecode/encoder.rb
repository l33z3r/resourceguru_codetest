require_relative 'unrecognised_character_error'

class Encoder
  MORSE_SYMBOLS_MAP = {
    'A': '.-', 'B': '-...', 'C': '-.-.', 'D': '-..', 'E': '.', 'F': '..-.', 'G': '--.', 'H': '....', 'I': '..',
    'J': '.---', 'K': '-.-', 'L': '.-..', 'M': '--', 'N': '-.', 'O': '---', 'P': '.--.', 'Q': '--.-', 'R': '.-.',
    'S': '...', 'T': '-', 'U': '..-', 'V': '...-', 'W': '.--', 'X': '-..-', 'Y': '-.--', 'Z': '--..', '0': '-----',
    '1': '.----', '2': '..---', '3': '...--', '4': '....-', '5': '.....', '6': '-....', '7': '--...', '8': '---..',
    '9': '----.', '.': '.-.-.-', ',': '--..--'
  }.freeze

  def initialize(file_path)
    @file_path = file_path
  end

  def encode_message
    File.open(@file_path, "r") do |f|
      f.each_line.map do |line|
        obfuscate(encode(line.strip.upcase))
      end
    end
  end

  private

  def encode(line)
    line.split(' ').map do |word|
      word.split('').map do |c|
        raise UnrecognisedCharacterError.new(c) if MORSE_SYMBOLS_MAP[c.to_sym].nil?

        MORSE_SYMBOLS_MAP[c.to_sym]
      end.join('|')
    end.join('/')
  end

  def obfuscate(line)
    line.gsub!(/\.+/) { |dots| dots.length }

    line.gsub!(/\-+/) { |dots| ('A'..'E').to_a[dots.length] }
  end
end

