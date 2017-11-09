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
    let!(:expected_encoded_message) { ["2/1A|B/1A/1A2|1|B1|2|A|2|B|1A|A|1/B|1|3|3|1A|B1|1"] }

    it 'returns a correctly encoded message' do
      expect(encoder.encode_message).to eq expected_encoded_message
    end
  end
end
