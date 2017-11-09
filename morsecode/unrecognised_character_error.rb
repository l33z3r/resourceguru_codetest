class UnrecognisedCharacterError < StandardError
  attr_reader :character

  def initialize(character)
    @character = character
  end
end