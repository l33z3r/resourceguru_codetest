require_relative '../flattener'

describe Flattener do
  let!(:flat_array) { [1, 2] }

  it 'returns the same array for already flattened array of integers' do
    expect(Flattener.new.flatten(array: flat_array)).to eq(flat_array)
  end

  let!(:complex_array) { [1,[[2],[[3]],4],[[[5],6]],[[7]],8]}
  let!(:complex_array_flattened) { [1, 2, 3, 4, 5, 6, 7, 8] }

  it 'flattens an arbitrarily nested array of integers' do
    expect(Flattener.new.flatten(array: complex_array)).to eq(complex_array_flattened)
  end
end