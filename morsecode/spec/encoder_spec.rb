require_relative '../encoder'

describe Encoder do
  let(:encoder) { Encoder.new(file_path) }

  context 'bad data' do
    let!(:file_path) { 'badtext.txt' }

    it 'throws an error when an invalid character is found' do
      expect { encoder.encode_message }.to raise_error UnrecognisedCharacterError
    end
  end

  context 'good data' do
    let!(:file_path) { 'goodtext.txt' }
    let!(:expected_encoded_message) { ["2/1B|C/1B/1B2|1|C1|2|B|2|C|1B|B|1/C|1|3|3|1B|C1|1"] }

    it 'returns a correctly encoded message' do
      expect(encoder.encode_message).to eq expected_encoded_message
    end
  end
end
