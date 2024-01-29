require_solution 'CHK'

describe Checkout do
  subject { Checkout.new.checkout(skus) }

  let(:skus) { 'ABCD' }

  it 'sums the price of all items' do
    expect(subject).to eq 115
  end

  context 'when skus has an invalid item' do
    let(:skus) { 'ABCDE' }

    it 'returns -1' do
      expect(subject).to eq -1
    end
  end

  context 'when skus has an invalid type' do
    let(:skus) { 0 }

    it 'returns -1' do
      expect(subject).to eq -1
    end
  end

  context 'when skus is nil' do
    let(:skus) { nil }

    it 'returns -1' do
      expect(subject).to eq -1
    end
  end

end



