require_solution 'CHK'

describe Checkout do
  subject { Checkout.new }

  let(:skus) { 'ABCD' }

  context 'when skus has an invalid item' do
    let(:skus) { 'ABCDE' }

    it 'returns -1' do
      expect(subject.checkout(skus)).to eq -1
    end
  end

  context 'when skus has an invalid type' do
    let(:skus) { 0 }

    it 'returns -1' do
      expect(subject.checkout(skus)).to eq -1
    end
  end

  context 'when skus is nil' do
    let(:skus) { nil }

    it 'returns -1' do
      expect(subject.checkout(skus)).to eq -1
    end
  end

end

