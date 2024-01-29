require_solution 'CHK'

describe Checkout do
  subject { Checkout.new.checkout(skus) }

  let(:skus) { 'ABCDEF' }

  it 'sums the price of all items' do
    expect(subject).to eq 165
  end

  context 'when skus has an invalid item' do
    let(:skus) { 'ABCD0' }

    it 'returns -1' do
      expect(subject).to eq -1
    end
  end

  context 'when skus is empty' do
    let(:skus) { '' }

    it 'returns 0' do
      expect(subject).to eq 0
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


  context 'when there are 3 As' do
    let(:skus) { 'AAA' }

    it 'has a discount' do
      expect(subject).to eq 130
    end

    context 'when there are 6 As' do
      let(:skus) { 'AAAAAA' }

      it 'has a discount' do
        expect(subject).to eq 250
      end
    end

    context 'when there are 8 As' do
      let(:skus) { 'AAAAAAAA' }

      it 'has a discount' do
        expect(subject).to eq 330
      end
    end

    context 'when there are 3 As and other items' do
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

    context 'when there are 6 As' do
      let(:skus) { 'BBBB' }

      it 'has a discount' do
        expect(subject).to eq 90
      end
    end

    context 'when there are 3 As and other items' do
      let(:skus) { 'AAABBCD' }

      it 'has a discount' do
        expect(subject).to eq 210
      end
    end
  end

  context 'when there are 2 Es and 1 B' do
    let(:skus) { 'EEB' }

    it 'has a discount' do
      expect(subject).to eq 80
    end

    context 'when there are 2 Es and 0 Bs' do
      let(:skus) { 'EE' }

      it 'has a discount' do
        expect(subject).to eq 80
      end
    end

    context 'when there are 4 Es and 2 Bs' do
      let(:skus) { 'EEEEBB' }

      it 'has a discount' do
        expect(subject).to eq 160
      end
    end
  end

  context 'when there are at least 3fs' do
    let(:skus) { 'FFF' }

    it 'has a discount' do
      expect(subject).to eq 20
    end

    context 'when there are 4' do
      let(:skus) { 'FFFF' }

      it 'has a discount' do
        expect(subject).to eq 30
      end
    end
  end

  context 'when SKU is H' do
    let(:skus) { 'HHHHHHHHHH' }

    it 'has a discount for 10 items' do
      expect(subject).to eq 80
    end

    context 'when there are 5' do
      let(:skus) { 'HHHHH' }

      it 'has a discount 5 items' do
        expect(subject).to eq 45
      end
    end

    context 'when there are ' do
      let(:skus) { 'HHHHHHHHHHHHHHH' }

      it 'has a discount 5 items' do
        expect(subject).to eq 125
      end
    end
  end

  context 'when SKU is K' do
    let(:skus) { 'KK' }

    it 'has a discount for 2 items' do
      expect(subject).to eq 120
    end

    context 'when there are 3' do
      let(:skus) { 'KKK' }

      it 'has a discount 2 items' do
        expect(subject).to eq 190
      end
    end
  end

  context 'when SKU is N' do
    let(:skus) { 'NNNM' }

    it 'has a free M for 3 N' do
      expect(subject).to eq 120
    end
  end

  context 'when SKU is P' do
    let(:skus) { 'PPPPP' }

    it 'has a discount every 5 items' do
      expect(subject).to eq 200
    end
  end

  context 'when SKU is Q' do
    let(:skus) { 'QQQ' }

    it 'has a discount every 3 items' do
      expect(subject).to eq 80
    end
  end

  context 'when SKU is R' do
    let(:skus) { 'RRRQQQ' }

    it 'has a free Q every 3 items' do
      expect(subject).to eq 210
    end
  end

  context 'when SKU is U' do
    let(:skus) { 'UUUU' }

    it 'has a free U every 3 items' do
      expect(subject).to eq 120
    end
  end

  context 'when SKU is V' do
    let(:skus) { 'VVVVV' }

    it 'has a discount' do
      expect(subject).to eq 220
    end
  end

  context 'when SKU is in the group S,T,X,Y,Z' do
    let(:skus) { 'STXYZ' }

    it 'has 3 items for 45' do
      expect(subject).to eq 45
    end
  end
end

