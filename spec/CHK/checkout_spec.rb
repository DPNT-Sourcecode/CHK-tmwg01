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

  context 'when skus is nil' do
    let(:skus) { nil }

    it 'returns -1' do
      expect(subject).to eq -1
    end
  end

  context 'when there is 3 As' do
    let(:skus) { 'AAA' }

    it 'has a discount' do
      expect(subject).to eq 130
    end

    context 'when there is 6 As' do
      let(:skus) { 'AAAAAA' }

      it 'has a discount' do
        expect(subject).to eq 260
      end
    end

    context 'when there is 3 As and other items' do
      let(:skus) { 'AAABCD' }

      it 'has a discount' do
        expect(subject).to eq 195
      end
    end
  end

  context 'when there is 2 Bs' do
    let(:skus) { 'BB' }

    it 'has a discount' do
      expect(subject).to eq 45
    end

    context 'when there is 6 As' do
      let(:skus) { 'BBBB' }

      it 'has a discount' do
        expect(subject).to eq 90
      end
    end

    context 'when there is 3 As and other items' do
      let(:skus) { 'AAABBCD' }

      it 'has a discount' do
        expect(subject).to eq 210
      end
    end
  end

end

