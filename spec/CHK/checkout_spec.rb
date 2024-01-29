require_solution 'HLO'

describe Checkout do
  subject { Hello.new }

  let(:friend_name) {  }

  it "says hello to the world" do
    expect(subject.hello(friend_name)).to eq "Hello, #{friend_name}!"
  end
end
