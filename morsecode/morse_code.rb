require_relative 'encoder'

begin
  puts Encoder.new('plaintext.txt').encode_message
rescue UnrecognisedCharacterError => e
  puts "Unrecognised Character '#{e.character}', please check your input"
end