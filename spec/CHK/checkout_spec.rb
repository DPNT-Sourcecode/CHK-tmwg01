require_solution 'HLO'

describe Checkout do
  subject { Checkout.new }

  let(:skus) { 'ABCD' }

  context 'when skus has an invalid item' do
    let(:skus) { 'ABCDE' }

    it
      expect(subject.checkuot(skus)).to eq -1
    end
  end


end
